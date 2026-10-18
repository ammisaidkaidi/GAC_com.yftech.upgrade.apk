package com.yftech.upgrade.wifi;

import android.app.Activity;
import android.net.NetworkInfo;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.security.Credentials;
import android.security.KeyStore;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Switch;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.yftech.upgrade.R;
import com.yftech.upgrade.app.MainService;
import com.yftech.upgrade.callback.IWiFiActionListener;
import com.yftech.upgrade.manager.WiFiManagerGlobal;
import com.yftech.upgrade.utils.Utils;
import com.yftech.upgrade.wifi.WiFiAdapter;
import com.yftech.upgrade.wifi.WiFiDialog;
import java.util.ArrayList;
import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public class WiFiActivity extends Activity implements IWiFiActionListener {
    private static String TAG = "WiFiActivity";
    private static final int WIFI_RESCAN_INTERVAL_MS = 10000;
    private RecyclerView mRecyclerView;
    private Switch mSwitch;
    private WiFiAdapter mWiFiAdapter;
    WiFiDialog wifiDialog;
    private final int MSG_SCAN_TIMEOUT = 16;
    private Handler mHandler = new Handler(new Handler.Callback() { // from class: com.yftech.upgrade.wifi.WiFiActivity.1
        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            Log.i(WiFiActivity.TAG, "handleMessage: " + message);
            if (16 != message.what) {
                return false;
            }
            WiFiManagerGlobal.getInstance().resumeScan();
            WiFiActivity.this.sendMessageScanWifi();
            return false;
        }
    });
    private WiFiDialog.WiFiDialogCallback mDialogClick = new WiFiDialog.WiFiDialogCallback() { // from class: com.yftech.upgrade.wifi.WiFiActivity.6
        @Override // com.yftech.upgrade.wifi.WiFiDialog.WiFiDialogCallback
        public void connect(WiFiItem wiFiItem) {
            WiFiActivity.this.submit(wiFiItem);
        }

        @Override // com.yftech.upgrade.wifi.WiFiDialog.WiFiDialogCallback
        public void disconnect(WiFiItem wiFiItem) {
            WiFiManagerGlobal.getInstance().disable(wiFiItem.getNetworkId());
            WiFiManagerGlobal.getInstance().disconnect();
        }

        @Override // com.yftech.upgrade.wifi.WiFiDialog.WiFiDialogCallback
        public void cancelSave(WiFiItem wiFiItem) {
            WiFiManagerGlobal.getInstance().forget(wiFiItem.getNetworkId(), WiFiActivity.this.mForget);
        }
    };
    private WifiManager.ActionListener mConnectListener = new WifiManager.ActionListener() { // from class: com.yftech.upgrade.wifi.WiFiActivity.7
        public void onSuccess() {
            Log.i(WiFiActivity.TAG, "mConnectListener onSuccess");
        }

        public void onFailure(int i) {
            Log.i(WiFiActivity.TAG, "mConnectListener onFailure:" + i);
        }
    };
    private WifiManager.ActionListener mForget = new WifiManager.ActionListener() { // from class: com.yftech.upgrade.wifi.WiFiActivity.8
        public void onSuccess() {
            Log.i(WiFiActivity.TAG, "mForget onSuccess");
        }

        public void onFailure(int i) {
            Log.i(WiFiActivity.TAG, "mForget onFailure:" + i);
        }
    };

    @Override // com.yftech.upgrade.callback.IWiFiActionListener
    public void onConnectionState(WifiInfo wifiInfo, NetworkInfo.DetailedState detailedState) {
    }

    @Override // com.yftech.upgrade.callback.IWiFiActionListener
    public void onScanStatusChanged(boolean z) {
    }

    private void removeMessageScanWifi() {
        this.mHandler.removeMessages(16);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendMessageScanWifi() {
        removeMessageScanWifi();
        this.mHandler.sendEmptyMessageDelayed(16, 10000L);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.layout_wifi);
        findViewById(R.id.btn_version).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.upgrade.wifi.WiFiActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Utils.startService(WiFiActivity.this, MainService.COMMAND_SHOW);
            }
        });
        findViewById(R.id.btn_finish).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.upgrade.wifi.WiFiActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                WiFiActivity.this.finish();
            }
        });
        this.mSwitch = (Switch) findViewById(R.id.switch_wifi);
        this.mRecyclerView = (RecyclerView) findViewById(R.id.recycleview_wifi_list);
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        this.mRecyclerView.addItemDecoration(new DividerItemDecoration(this, 1));
        this.mWiFiAdapter = new WiFiAdapter();
        this.mWiFiAdapter.setItemClickListener(new WiFiAdapter.ItemClickListener() { // from class: com.yftech.upgrade.wifi.WiFiActivity.4
            @Override // com.yftech.upgrade.wifi.WiFiAdapter.ItemClickListener
            public void onItemClicked(WiFiItem wiFiItem) {
                Log.e(WiFiActivity.TAG, "onItemClicked: " + wiFiItem);
                WiFiActivity.this.callBackOnItemClick(wiFiItem);
            }
        });
        this.mRecyclerView.setAdapter(this.mWiFiAdapter);
        update();
        this.mSwitch.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.upgrade.wifi.WiFiActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                WiFiActivity.this.setWiFiStatus();
            }
        });
        WiFiManagerGlobal.getInstance().addListener(this);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        WiFiManagerGlobal.getInstance().resumeScan();
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        removeMessageScanWifi();
        WiFiManagerGlobal.getInstance().pauseScan();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.mHandler.removeCallbacksAndMessages(null);
        dismissWiFiDialog();
        WiFiManagerGlobal.getInstance().removeListener(this);
        super.onDestroy();
    }

    private void update() {
        updateWiFiStatus(WiFiManagerGlobal.getInstance().getStatus());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setWiFiStatus() {
        int status = WiFiManagerGlobal.getInstance().getStatus();
        Log.e(TAG, "setWiFiStatus, current: " + status);
        if (status == 1) {
            WiFiManagerGlobal.getInstance().open();
        } else {
            if (status != 3) {
                return;
            }
            WiFiManagerGlobal.getInstance().close();
        }
    }

    private void updateWiFiStatus(int i) {
        Log.i(TAG, "updateWiFiStatus: " + i);
        removeMessageScanWifi();
        if (i == 0) {
            this.mSwitch.setEnabled(false);
            this.mSwitch.setChecked(false);
            return;
        }
        if (i == 1) {
            this.mSwitch.setEnabled(true);
            this.mSwitch.setChecked(false);
            this.mWiFiAdapter.setList(new ArrayList());
        } else if (i == 2) {
            this.mSwitch.setEnabled(false);
            this.mSwitch.setChecked(true);
        } else {
            if (i != 3) {
                return;
            }
            this.mSwitch.setEnabled(true);
            this.mSwitch.setChecked(true);
            sendMessageScanWifi();
        }
    }

    protected void callBackOnItemClick(WiFiItem wiFiItem) {
        if (wiFiItem.getSecurity() == 0) {
            Log.i(TAG, "callBackOnItemClick: SECURITY_NONE");
            wiFiItem.generateOpenNetworkConfig();
            WiFiManagerGlobal.getInstance().addNetwork(wiFiItem.getConfig());
            return;
        }
        if (wiFiItem.getNetworkId() != -1 && !requireKeyStore(wiFiItem.getConfig()) && WiFiManagerGlobal.getInstance().configValid(wiFiItem.getConfig())) {
            if (WiFiManagerGlobal.getInstance().isConnected(wiFiItem.getDetailedState())) {
                Log.i(TAG, "callBackOnItemClick: disconnect");
                showWifiDialog(wiFiItem, false);
                return;
            } else {
                Log.i(TAG, "callBackOnItemClick: connect");
                WiFiManagerGlobal.getInstance().connect(wiFiItem.getNetworkId(), (WifiManager.ActionListener) null);
                return;
            }
        }
        WifiConfiguration config = wiFiItem.getConfig();
        if (config != null && config.getNetworkSelectionStatus().getNetworkSelectionDisableReason() == 3) {
            Log.i(TAG, "callBackOnItemClick: forget");
            WiFiManagerGlobal.getInstance().forget(wiFiItem.getNetworkId(), this.mForget);
        } else {
            showWifiDialog(wiFiItem, true);
        }
    }

    private void showWifiDialog(WiFiItem wiFiItem, boolean z) {
        dismissWiFiDialog();
        this.wifiDialog = new WiFiDialog(this, this.mDialogClick, wiFiItem, true);
        this.wifiDialog.setCanceledOnTouchOutside(false);
        Window window = this.wifiDialog.getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        window.setGravity(17);
        window.setAttributes(attributes);
        this.wifiDialog.show();
        this.wifiDialog.showConnectView(z);
    }

    private void dismissWiFiDialog() {
        WiFiDialog wiFiDialog = this.wifiDialog;
        if (wiFiDialog != null && wiFiDialog.isShowing()) {
            this.wifiDialog.dismiss();
        }
        this.wifiDialog = null;
    }

    public void submit(WiFiItem wiFiItem) {
        WifiConfiguration wifiConfiguration;
        WiFiDialog wiFiDialog = this.wifiDialog;
        if (wiFiDialog != null) {
            wifiConfiguration = wiFiDialog.getConfig();
            this.wifiDialog.dismiss();
            this.wifiDialog = null;
        } else {
            wifiConfiguration = null;
        }
        Log.i(TAG, "submit: " + wifiConfiguration + "," + wiFiItem);
        if (wifiConfiguration == null) {
            if (!requireKeyStore(wiFiItem.getConfig()) && wiFiItem.getNetworkId() != -1) {
                Log.i(TAG, "submit: 11");
                WiFiManagerGlobal.getInstance().connect(wiFiItem.getNetworkId(), this.mConnectListener);
            } else {
                Log.i(TAG, "submit: ignore 11");
            }
        } else if (wifiConfiguration.networkId != -1) {
            WiFiManagerGlobal.getInstance().addNetwork(wifiConfiguration);
            WiFiManagerGlobal.getInstance().reconnect();
            Log.i(TAG, "submit: 22");
        } else {
            WiFiManagerGlobal.getInstance().addNetwork(wifiConfiguration);
            Log.i(TAG, "submit: 33");
            WiFiManagerGlobal.getInstance().reconnect();
        }
        WiFiManagerGlobal.getInstance().startScan(false);
        WiFiManagerGlobal.getInstance().updateWifiItems();
    }

    private boolean requireKeyStore(WifiConfiguration wifiConfiguration) {
        if (!WiFiSecurity.requireKeyStore(wifiConfiguration) || KeyStore.getInstance().state() == KeyStore.State.UNLOCKED) {
            return false;
        }
        Credentials.getInstance().unlock(getApplicationContext());
        return true;
    }

    @Override // com.yftech.upgrade.callback.IWiFiActionListener
    public void onWiFiListChanged(List<WiFiItem> list) {
        for (WiFiItem wiFiItem : list) {
        }
        this.mWiFiAdapter.setList(list);
    }

    @Override // com.yftech.upgrade.callback.IWiFiActionListener
    public void onWiFiStatusChanged(int i) {
        updateWiFiStatus(i);
    }
}
