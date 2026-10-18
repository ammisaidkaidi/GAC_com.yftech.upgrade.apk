package com.yftech.upgrade.manager;

import android.os.SystemProperties;
import android.util.Log;
import java.text.SimpleDateFormat;

/* loaded from: /home/user/work/dex/classes.dex */
public class VersionManagerGlobal {
    private static String TAG = "VersionManagerGlobal";

    public static String getSupplier() {
        return SystemProperties.get("persist.vehicle.suppliercode", "");
    }

    public static String getPartNumber() {
        return SystemProperties.get("persist.vehicle.pn", "");
    }

    public static String getSN() {
        return SystemProperties.get("persist.vehicle.sn", "");
    }

    public static String getVIN() {
        return SystemProperties.get("persist.vehicle.vin", "");
    }

    public static String getMcuVersion() {
        return SystemProperties.get("persist.version.mcu", "");
    }

    public static String getSystemVersion() {
        return SystemProperties.get("ro.build.display.id", "");
    }

    public static String getDisplaySn() {
        String str = SystemProperties.get("persist.bsp.display.sn", "");
        Log.i(TAG, "getDisplaySn: " + str);
        return str;
    }

    public static String getDisplayPn() {
        String str = SystemProperties.get("persist.bsp.display.pn", "");
        Log.i(TAG, "getDisplayPn: " + str);
        return str;
    }

    public static String getDisplayCreateDate() {
        String str = SystemProperties.get("persist.bsp.display.create.date", "");
        Log.i(TAG, "getDisplayCreateDate: " + str);
        if (str.length() == 0) {
            return null;
        }
        try {
            return new SimpleDateFormat("yyyy年M月d日").format(new SimpleDateFormat("ddMMyy").parse(str));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getDisplaySoftwareVersion() {
        String str = SystemProperties.get("persist.bsp.display.ver.software", "");
        Log.i(TAG, "getDisplaySoftwareVersion: " + str);
        return str;
    }

    public static String getDisplayHardwareVersion() {
        String str = SystemProperties.get("persist.bsp.display.ver.hardware", "");
        Log.i(TAG, "getDisplayHardwareVersion: " + str);
        return str;
    }

    public static String getDisplaySupplierSoftwareVersion() {
        return SystemProperties.get("persist.bsp.display.ver.supplier.software", "");
    }

    public static String getDisplaySupplierHardwareVersion() {
        return SystemProperties.get("persist.bsp.display.ver.supplier.hardware", "");
    }
}
