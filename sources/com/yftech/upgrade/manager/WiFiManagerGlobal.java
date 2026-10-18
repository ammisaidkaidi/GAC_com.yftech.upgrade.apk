package com.yftech.upgrade.manager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.display.WifiDisplayStatus;
import android.net.NetworkInfo;
import android.net.wifi.ScanResult;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.util.Log;
import com.yftech.upgrade.callback.IWiFiActionListener;
import com.yftech.upgrade.wifi.WiFiItem;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public class WiFiManagerGlobal {
    private static final int WIFI_RESCAN_INTERVAL_MS = 10000;
    private static WiFiManagerGlobal mInstance = null;
    private static final int tag_scan = 20496;
    private Context mContext;
    private WifiInfo mLastInfo;
    private NetworkInfo.DetailedState mLastState;
    private Scanner mScanner;
    private WifiDisplayStatus mWifiDisplayStatus;
    private WifiManager mWifiManager;
    private Handler mWorkHandler;
    private HandlerThread mWorkThread;
    private String TAG = "WiFiManagerGlobal";
    private ArrayList<IWiFiActionListener> mActionListeners = new ArrayList<>();
    final BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.yftech.upgrade.manager.WiFiManagerGlobal.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if ("android.net.wifi.WIFI_STATE_CHANGED".equals(action)) {
                WiFiManagerGlobal.this.updateWifiState(intent.getIntExtra("wifi_state", 4));
                return;
            }
            if ("android.net.wifi.SCAN_RESULTS".equals(action) || "android.net.wifi.CONFIGURED_NETWORKS_CHANGE".equals(action) || "android.net.wifi.LINK_CONFIGURATION_CHANGED".equals(action)) {
                WiFiManagerGlobal.this.notifyScanStatus(false);
                WiFiManagerGlobal.this.updateWifiItems();
                return;
            }
            if ("android.net.wifi.supplicant.STATE_CHANGE".equals(action)) {
                WiFiManagerGlobal.this.updateConnectionState(WifiInfo.getDetailedStateOf((SupplicantState) intent.getParcelableExtra("newState")));
                return;
            }
            if ("android.net.wifi.STATE_CHANGE".equals(action)) {
                NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
                Log.d(WiFiManagerGlobal.this.TAG, "info.isConnected()=" + networkInfo.isConnected());
                WiFiManagerGlobal.this.updateWifiItems();
                WiFiManagerGlobal.this.updateConnectionState(networkInfo.getDetailedState());
                return;
            }
            if ("android.net.wifi.RSSI_CHANGED".equals(action)) {
                WiFiManagerGlobal.this.updateConnectionState(null);
            } else if (intent.getAction().equals("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED")) {
                WiFiManagerGlobal.this.mWifiDisplayStatus = intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS");
            }
        }
    };
    private WifiManager.ActionListener mConnectListener = new WifiManager.ActionListener() { // from class: com.yftech.upgrade.manager.WiFiManagerGlobal.2
        public void onFailure(int i) {
        }

        public void onSuccess() {
        }
    };
    private WifiManager.ActionListener mForgetListener = new WifiManager.ActionListener() { // from class: com.yftech.upgrade.manager.WiFiManagerGlobal.3
        public void onFailure(int i) {
        }

        public void onSuccess() {
        }
    };

    public static WiFiManagerGlobal getInstance() {
        if (mInstance == null) {
            mInstance = new WiFiManagerGlobal();
        }
        return mInstance;
    }

    private WiFiManagerGlobal() {
    }

    public void init(Context context) {
        this.mContext = context;
        this.mWifiManager = (WifiManager) this.mContext.getSystemService(WifiManager.class);
        this.mScanner = new Scanner();
        HandlerThread handlerThread = new HandlerThread(this.TAG + "{" + Integer.toHexString(System.identityHashCode(this)) + "}", 10);
        handlerThread.start();
        setWorkThread(handlerThread);
    }

    void setWorkThread(HandlerThread handlerThread) {
        this.mWorkThread = handlerThread;
        this.mWorkHandler = new Handler(handlerThread.getLooper());
        this.mContext.registerReceiver(this.mReceiver, newIntentFilter());
    }

    public void stop() {
        HandlerThread handlerThread = this.mWorkThread;
        if (handlerThread != null) {
            handlerThread.quit();
        }
    }

    public void addListener(IWiFiActionListener iWiFiActionListener) {
        synchronized (this.mActionListeners) {
            if (!this.mActionListeners.contains(iWiFiActionListener)) {
                this.mActionListeners.add(iWiFiActionListener);
            }
        }
    }

    public void removeListener(IWiFiActionListener iWiFiActionListener) {
        synchronized (this.mActionListeners) {
            this.mActionListeners.remove(iWiFiActionListener);
        }
    }

    public void open() {
        if (!this.mWifiManager.isWifiEnabled()) {
            this.mWifiManager.setWifiEnabled(true);
        } else {
            Log.e(this.TAG, "open: isWifiEnabled true already");
        }
    }

    public void close() {
        if (this.mWifiManager.isWifiEnabled()) {
            this.mWifiManager.setWifiEnabled(false);
        } else {
            Log.e(this.TAG, "remove: isWifiEnabled false already");
        }
    }

    public int getStatus() {
        return this.mWifiManager.getWifiState();
    }

    public void startScan(boolean z) {
        if (this.mWifiManager.isWifiEnabled()) {
            if (z) {
                this.mScanner.forceScan();
            } else {
                resumeScan();
            }
        }
    }

    public void resumeScan() {
        if (this.mWifiManager.isWifiEnabled()) {
            this.mScanner.resume();
        }
    }

    public void pauseScan() {
        this.mScanner.pause();
    }

    private void startScanEx() {
        if (this.mWifiManager.isWifiEnabled()) {
            this.mWifiManager.startScan(null);
        } else {
            Log.e(this.TAG, "startScanEx: isWifiEnabled false, ignore");
        }
    }

    public void forget(int i, WifiManager.ActionListener actionListener) {
        if (i == -1) {
            Log.e("setup", "Failed to forget invalid network " + i);
            return;
        }
        this.mWifiManager.forget(i, actionListener);
        resumeScan();
        updateWifiItems();
    }

    public int addNetwork(WifiConfiguration wifiConfiguration) {
        int addNetwork = this.mWifiManager.addNetwork(wifiConfiguration);
        if (addNetwork != -1) {
            this.mWifiManager.enableNetwork(addNetwork, true);
            this.mWifiManager.saveConfiguration();
        }
        return addNetwork;
    }

    public void disconnect() {
        this.mWifiManager.disconnect();
        this.mWifiManager.saveConfiguration();
    }

    public void disable(int i) {
        this.mWifiManager.disableNetwork(i);
    }

    public void enable(int i) {
        this.mWifiManager.enableNetwork(i, false);
    }

    public boolean isConnected(NetworkInfo.DetailedState detailedState) {
        return detailedState != null && NetworkInfo.DetailedState.CONNECTED == detailedState;
    }

    public boolean configValid(WifiConfiguration wifiConfiguration) {
        return (wifiConfiguration == null || wifiConfiguration.getNetworkSelectionStatus().getNetworkSelectionDisableReason() == 3) ? false : true;
    }

    public void connect(int i, WifiManager.ActionListener actionListener) {
        this.mWifiManager.connect(i, actionListener);
    }

    public void connect(WifiConfiguration wifiConfiguration, WifiManager.ActionListener actionListener) {
        this.mWifiManager.connect(wifiConfiguration, actionListener);
    }

    public void reconnect() {
        this.mWifiManager.reconnect();
    }

    public void notifyWiFiStatus(int i) {
        synchronized (this.mActionListeners) {
            Iterator<IWiFiActionListener> it = this.mActionListeners.iterator();
            while (it.hasNext()) {
                it.next().onWiFiStatusChanged(i);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyScanStatus(boolean z) {
        synchronized (this.mActionListeners) {
            Iterator<IWiFiActionListener> it = this.mActionListeners.iterator();
            while (it.hasNext()) {
                it.next().onScanStatusChanged(z);
            }
        }
    }

    private void notifyWiFiList(List<WiFiItem> list) {
        synchronized (this.mActionListeners) {
            Iterator<IWiFiActionListener> it = this.mActionListeners.iterator();
            while (it.hasNext()) {
                it.next().onWiFiListChanged(list);
            }
        }
    }

    private void notifyConnectionState(WifiInfo wifiInfo, NetworkInfo.DetailedState detailedState) {
        synchronized (this.mActionListeners) {
            Iterator<IWiFiActionListener> it = this.mActionListeners.iterator();
            while (it.hasNext()) {
                it.next().onConnectionState(wifiInfo, detailedState);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: /home/user/work/dex/classes.dex */
    public class Scanner extends Handler {
        private int mRetry;

        private Scanner() {
            this.mRetry = 0;
        }

        void resume() {
            if (hasMessages(0)) {
                return;
            }
            sendEmptyMessage(0);
        }

        void forceScan() {
            removeMessages(0);
            sendEmptyMessage(0);
        }

        void pause() {
            this.mRetry = 0;
            removeMessages(0);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            try {
                if (WiFiManagerGlobal.this.mWifiManager.startScan()) {
                    this.mRetry = 0;
                    return;
                }
                int i = this.mRetry + 1;
                this.mRetry = i;
                if (i >= 3) {
                    this.mRetry = 0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static IntentFilter newIntentFilter() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
        intentFilter.addAction("android.net.wifi.SCAN_RESULTS");
        intentFilter.addAction("android.net.wifi.NETWORK_IDS_CHANGED");
        intentFilter.addAction("android.net.wifi.supplicant.STATE_CHANGE");
        intentFilter.addAction("android.net.wifi.CONFIGURED_NETWORKS_CHANGE");
        intentFilter.addAction("android.net.wifi.STATE_CHANGE");
        intentFilter.addAction("android.net.wifi.RSSI_CHANGED");
        intentFilter.addAction("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED");
        return intentFilter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateWifiState(int i) {
        notifyWiFiStatus(i);
        if (i != 0 && i != 1 && i != 2) {
            if (i == 3) {
                return;
            }
            if (i == 4) {
                close();
            }
        }
        this.mLastInfo = null;
        this.mLastState = null;
        this.mScanner.pause();
    }

    public void updateWifiItems() {
        int status = getStatus();
        if (status == 0 || status == 2 || status != 3) {
            return;
        }
        notifyWiFiList(constructWifiItems());
    }

    private List<WiFiItem> constructWifiItems() {
        ArrayList arrayList = new ArrayList();
        Multimap multimap = new Multimap();
        List<WifiConfiguration> configuredNetworks = this.mWifiManager.getConfiguredNetworks();
        if (configuredNetworks != null) {
            Iterator<WifiConfiguration> it = configuredNetworks.iterator();
            while (it.hasNext()) {
                WiFiItem wiFiItem = new WiFiItem(this.mContext, it.next());
                wiFiItem.update(this.mLastInfo, this.mLastState);
                arrayList.add(wiFiItem);
                multimap.put(wiFiItem.getSsid(), wiFiItem);
            }
        }
        List<ScanResult> scanResults = this.mWifiManager.getScanResults();
        if (scanResults != null) {
            for (ScanResult scanResult : scanResults) {
                if (scanResult.SSID != null && scanResult.SSID.length() != 0 && !scanResult.capabilities.contains("[IBSS]")) {
                    boolean z = false;
                    Iterator it2 = multimap.getAll(scanResult.SSID).iterator();
                    while (it2.hasNext()) {
                        if (((WiFiItem) it2.next()).update(scanResult)) {
                            z = true;
                        }
                    }
                    if (!z) {
                        WiFiItem wiFiItem2 = new WiFiItem(this.mContext, scanResult);
                        arrayList.add(wiFiItem2);
                        multimap.put(wiFiItem2.getSsid(), wiFiItem2);
                    }
                }
            }
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateConnectionState(NetworkInfo.DetailedState detailedState) {
        if (!this.mWifiManager.isWifiEnabled()) {
            this.mScanner.pause();
            return;
        }
        if (detailedState == NetworkInfo.DetailedState.OBTAINING_IPADDR) {
            pauseScan();
        }
        this.mLastInfo = this.mWifiManager.getConnectionInfo();
        if (detailedState != null) {
            this.mLastState = detailedState;
        }
        notifyConnectionState(this.mLastInfo, this.mLastState);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: /home/user/work/dex/classes.dex */
    public class Multimap<K, V> {
        private HashMap<K, List<V>> store;

        private Multimap() {
            this.store = new HashMap<>();
        }

        List<V> getAll(K k) {
            List<V> list = this.store.get(k);
            return list != null ? list : Collections.emptyList();
        }

        void put(K k, V v) {
            List<V> list = this.store.get(k);
            if (list == null) {
                list = new ArrayList<>(3);
                this.store.put(k, list);
            }
            list.add(v);
        }
    }
}
