package com.yftech.upgrade.callback;

import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import com.yftech.upgrade.wifi.WiFiItem;
import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public interface IWiFiActionListener {
    default void onConnectionState(WifiInfo wifiInfo, NetworkInfo.DetailedState detailedState) {
    }

    default void onScanStatusChanged(boolean z) {
    }

    default void onWiFiListChanged(List<WiFiItem> list) {
    }

    default void onWiFiStatusChanged(int i) {
    }
}
