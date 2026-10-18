package com.yftech.upgrade.data;

import android.os.Build;
import android.os.SystemProperties;

/* loaded from: /home/user/work/dex/classes.dex */
public class Config {
    public static final String CONFIG_FILE_NAME = "upgrade.cfg";
    public static final boolean DEBUG = false;
    public static final String DOMAIN_ADDRESS = "https://otapi.yftech.com";
    public static final String DOMAIN_ADDRESS_ABROAD = "https://gacota.yftech.com";
    public static final String DOMAIN_ADDRESS_TEST = "http://192.168.28.119";
    public static final int DOWNLOAD_BUFFER_SIZE = 8192;
    public static final int FILE_BUFFER_SIZE = 61440;
    public static String FILE_NAME_MCU = "mcuupgrade.bin";
    public static String FILE_NAME_MCU_MD5 = "mcuupgrade.md5";
    public static String FILE_NAME_OS = "update.zip";
    public static String FILE_NAME_OS_MD5 = "update.md5";
    public static final String PREFFIX_ABROAD = "/ota/checkUpdate";
    public static String UPGRADE_DIR = "/sdcard/upgrade/";

    public static String buildAddress() {
        return (ProjectManager.isAbroadProject() ? DOMAIN_ADDRESS_ABROAD : DOMAIN_ADDRESS) + PREFFIX_ABROAD;
    }

    public static String getBrand() {
        return Build.BRAND;
    }

    public static String getBrandExt() {
        return SystemProperties.get("ro.product.brand_ext", "");
    }
}
