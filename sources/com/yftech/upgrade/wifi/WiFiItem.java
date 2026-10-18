package com.yftech.upgrade.wifi;

import android.content.Context;
import android.net.NetworkInfo;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import com.yftech.upgrade.R;
import com.yftech.upgrade.wifi.WiFiSecurity;

/* loaded from: /home/user/work/dex/classes.dex */
public class WiFiItem implements Comparable<WiFiItem> {
    private String bssid;
    private Context context;
    private NetworkInfo.DetailedState detailedState;
    private int mRssi;
    private ScanResult scanResult;
    private int security;
    private String ssid;
    private WifiConfiguration wifiConfig;
    private WifiInfo wifiInfo;
    private WiFiSecurity.PskType pskType = WiFiSecurity.PskType.UNKNOWN;
    private int networkId = -1;
    boolean wpsAvailable = false;

    public WiFiItem(Context context, ScanResult scanResult) {
        this.context = context;
        loadScanResult(scanResult);
    }

    public WiFiItem(Context context, WifiConfiguration wifiConfiguration) {
        this.context = context;
        loadWifiConfiguration(wifiConfiguration);
    }

    public boolean equals(Object obj) {
        return (obj instanceof WiFiItem) && compareTo((WiFiItem) obj) == 0;
    }

    @Override // java.lang.Comparable
    public int compareTo(WiFiItem wiFiItem) {
        if (this.wifiInfo != null && wiFiItem.wifiInfo == null) {
            return -1;
        }
        if (this.wifiInfo == null && wiFiItem.wifiInfo != null) {
            return 1;
        }
        if (this.mRssi != Integer.MAX_VALUE && wiFiItem.mRssi == Integer.MAX_VALUE) {
            return -1;
        }
        if (this.mRssi == Integer.MAX_VALUE && wiFiItem.mRssi != Integer.MAX_VALUE) {
            return 1;
        }
        if (this.networkId != -1 && wiFiItem.networkId == -1) {
            return -1;
        }
        if (this.networkId == -1 && wiFiItem.networkId != -1) {
            return 1;
        }
        int compareSignalLevel = WifiManager.compareSignalLevel(wiFiItem.mRssi, this.mRssi);
        return compareSignalLevel != 0 ? compareSignalLevel : this.ssid.compareToIgnoreCase(wiFiItem.ssid);
    }

    private void loadScanResult(ScanResult scanResult) {
        this.bssid = scanResult.BSSID;
        this.ssid = scanResult.SSID;
        this.mRssi = scanResult.level;
        this.scanResult = scanResult;
        this.security = WiFiSecurity.getSecurity(scanResult);
        this.wpsAvailable = this.security != 3 && scanResult.capabilities.contains("WPS");
        if (this.security == 2) {
            this.pskType = WiFiSecurity.getPskType(scanResult);
        }
        this.networkId = -1;
    }

    private void loadWifiConfiguration(WifiConfiguration wifiConfiguration) {
        this.ssid = wifiConfiguration.SSID == null ? "" : removeDoubleQuotes(wifiConfiguration.SSID);
        this.bssid = wifiConfiguration.BSSID;
        this.security = WiFiSecurity.getSecurity(wifiConfiguration);
        this.networkId = wifiConfiguration.networkId;
        this.mRssi = Integer.MAX_VALUE;
        this.wifiConfig = wifiConfiguration;
    }

    public boolean update(ScanResult scanResult) {
        if (!this.ssid.equals(scanResult.SSID) || this.security != WiFiSecurity.getSecurity(scanResult)) {
            return false;
        }
        if (WifiManager.compareSignalLevel(scanResult.level, this.mRssi) > 0) {
            getLevel();
            this.mRssi = scanResult.level;
        }
        if (this.security != 2) {
            return true;
        }
        this.pskType = WiFiSecurity.getPskType(scanResult);
        return true;
    }

    public void update(WifiInfo wifiInfo, NetworkInfo.DetailedState detailedState) {
        int i;
        if (wifiInfo != null && (i = this.networkId) != -1 && i == wifiInfo.getNetworkId()) {
            this.mRssi = wifiInfo.getRssi();
            this.wifiInfo = wifiInfo;
            this.detailedState = detailedState;
        } else if (this.wifiInfo != null) {
            this.wifiInfo = null;
            this.detailedState = null;
        }
    }

    public int getLevel() {
        int i = this.mRssi;
        if (i == Integer.MAX_VALUE) {
            return -1;
        }
        return WifiManager.calculateSignalLevel(i, 4);
    }

    public WifiConfiguration getConfig() {
        return this.wifiConfig;
    }

    public NetworkInfo.DetailedState getDetailedState() {
        return this.detailedState;
    }

    public int getSecurity() {
        return this.security;
    }

    public String getSsid() {
        return this.ssid;
    }

    public int getNetworkId() {
        return this.networkId;
    }

    public int getRssi() {
        return this.mRssi;
    }

    public void generateOpenNetworkConfig() {
        if (this.security != 0) {
            throw new IllegalStateException();
        }
        if (this.wifiConfig != null) {
            return;
        }
        this.wifiConfig = new WifiConfiguration();
        this.wifiConfig.SSID = convertToQuotedString(this.ssid);
        this.wifiConfig.allowedKeyManagement.set(0);
    }

    public static String convertToQuotedString(String str) {
        return "\"" + str + "\"";
    }

    public static String removeDoubleQuotes(String str) {
        int length = str.length();
        if (length <= 1 || str.charAt(0) != '\"') {
            return str;
        }
        int i = length - 1;
        return str.charAt(i) == '\"' ? str.substring(1, i) : str;
    }

    public String getWifiItemMsg() {
        String string;
        NetworkInfo.DetailedState detailedState = this.detailedState;
        if (detailedState != null) {
            return WiFiSecurity.getWiFiStateDescription(this.context, detailedState);
        }
        if (this.mRssi == Integer.MAX_VALUE) {
            return this.wifiConfig != null ? this.context.getString(R.string.wifi_remembered) : this.context.getString(R.string.wifi_not_in_range);
        }
        WifiConfiguration wifiConfiguration = this.wifiConfig;
        if (wifiConfiguration != null && wifiConfiguration.status == 1) {
            int networkSelectionDisableReason = this.wifiConfig.getNetworkSelectionStatus().getNetworkSelectionDisableReason();
            if (networkSelectionDisableReason == 3) {
                return this.context.getString(R.string.wifi_disabled_password_failure);
            }
            if (networkSelectionDisableReason == 4 || networkSelectionDisableReason == 5) {
                return this.context.getString(R.string.wifi_disabled_network_failure);
            }
            if (networkSelectionDisableReason == 7 || networkSelectionDisableReason == 11) {
                return this.context.getString(R.string.wifi_remembered);
            }
            return "" + this.wifiConfig.getNetworkSelectionStatus().getNetworkSelectionDisableReason();
        }
        StringBuilder sb = new StringBuilder();
        if (this.wifiConfig != null) {
            sb.append(this.context.getString(R.string.wifi_remembered));
        }
        if (this.security != 0) {
            if (sb.length() == 0) {
                string = this.context.getString(R.string.wifi_secured_first_item);
            } else {
                string = this.context.getString(R.string.wifi_secured_second_item);
            }
            sb.append(String.format(string, WiFiSecurity.getSecurityString(this.context, this.security, this.pskType.ordinal(), true)));
        }
        if (this.wifiConfig == null && this.wpsAvailable) {
            if (sb.length() == 0) {
                sb.append(this.context.getString(R.string.wifi_wps_available_first_item));
            } else {
                sb.append(this.context.getString(R.string.wifi_wps_available_second_item));
            }
        }
        return sb.toString();
    }
}
