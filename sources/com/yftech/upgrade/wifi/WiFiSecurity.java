package com.yftech.upgrade.wifi;

import android.content.Context;
import android.net.NetworkInfo;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import com.yftech.upgrade.R;

/* loaded from: /home/user/work/dex/classes.dex */
public class WiFiSecurity {
    public static final int SECURITY_EAP = 3;
    public static final int SECURITY_NONE = 0;
    public static final int SECURITY_PSK = 2;
    public static final int SECURITY_WEP = 1;
    public static final int[] STATE_SECURED = {R.attr.state_encrypted};
    public static final int[] STATE_NONE = new int[0];

    public static int getSignalImageResouce(boolean z, int i) {
        return -1;
    }

    public static boolean requireKeyStore(WifiConfiguration wifiConfiguration) {
        if (wifiConfiguration == null) {
        }
        return false;
    }

    /* loaded from: /home/user/work/dex/classes.dex */
    public enum PskType {
        UNKNOWN,
        WPA,
        WPA2,
        WPA_WPA2;

        public static PskType getPskType(int i) {
            if (i == 0) {
                return UNKNOWN;
            }
            if (i == 1) {
                return WPA;
            }
            if (i == 2) {
                return WPA2;
            }
            if (i != 3) {
                return null;
            }
            return WPA_WPA2;
        }
    }

    public static PskType getPskType(ScanResult scanResult) {
        boolean contains = scanResult.capabilities.contains("WPA-PSK");
        boolean contains2 = scanResult.capabilities.contains("WPA2-PSK");
        if (contains2 && contains) {
            return PskType.WPA_WPA2;
        }
        if (contains2) {
            return PskType.WPA2;
        }
        if (contains) {
            return PskType.WPA;
        }
        return PskType.UNKNOWN;
    }

    public static int getSecurity(WifiConfiguration wifiConfiguration) {
        if (wifiConfiguration.allowedKeyManagement.get(1)) {
            return 2;
        }
        if (wifiConfiguration.allowedKeyManagement.get(2) || wifiConfiguration.allowedKeyManagement.get(3)) {
            return 3;
        }
        return wifiConfiguration.wepKeys[0] != null ? 1 : 0;
    }

    public static int getSecurity(ScanResult scanResult) {
        if (scanResult.capabilities.contains("WEP")) {
            return 1;
        }
        if (scanResult.capabilities.contains("PSK")) {
            return 2;
        }
        return scanResult.capabilities.contains("EAP") ? 3 : 0;
    }

    public static String getSecurityString(Context context, int i, int i2, boolean z) {
        if (i != 1) {
            if (i != 2) {
                if (i != 3) {
                    return z ? "" : context.getString(R.string.wifi_security_none);
                }
                return context.getString(z ? R.string.wifi_security_short_eap : R.string.wifi_security_eap);
            }
            if (i2 == PskType.WPA.ordinal()) {
                return context.getString(z ? R.string.wifi_security_short_wpa : R.string.wifi_security_wpa);
            }
            if (i2 == PskType.WPA2.ordinal()) {
                return context.getString(z ? R.string.wifi_security_short_wpa2 : R.string.wifi_security_wpa2);
            }
            if (i2 == PskType.WPA_WPA2.ordinal()) {
                return context.getString(z ? R.string.wifi_security_short_wpa_wpa2 : R.string.wifi_security_wpa_wpa2);
            }
            if (i2 == PskType.UNKNOWN.ordinal()) {
                return context.getString(z ? R.string.wifi_security_short_psk_generic : R.string.wifi_security_psk_generic);
            }
        }
        return context.getString(z ? R.string.wifi_security_short_wep : R.string.wifi_security_wep);
    }

    public static String getWiFiStateDescription(Context context, String str, NetworkInfo.DetailedState detailedState) {
        String[] stringArray = context.getResources().getStringArray(str == null ? R.array.wifi_status : R.array.wifi_status_with_ssid);
        int ordinal = detailedState.ordinal();
        if (ordinal >= stringArray.length || stringArray[ordinal].length() == 0) {
            return null;
        }
        return String.format(stringArray[ordinal], str);
    }

    public static String getWiFiStateDescription(Context context, NetworkInfo.DetailedState detailedState) {
        return getWiFiStateDescription(context, null, detailedState);
    }
}
