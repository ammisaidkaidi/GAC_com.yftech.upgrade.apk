package com.yftech.upgrade.utils;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.yftech.upgrade.app.MainService;
import com.yftech.upgrade.data.Config;
import com.yftech.upgrade.wifi.WiFiActivity;
import java.util.Arrays;
import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public class Utils {
    private static char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    private static SharedPreferences mSharedPreferences;
    private static SharedPreferences.Editor mSharedPreferencesEditor;

    public static String toHexString(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (int i = 0; i < bArr.length; i++) {
            sb.append(HEX_DIGITS[(bArr[i] & 240) >>> 4]);
            sb.append(HEX_DIGITS[bArr[i] & 15]);
        }
        return sb.toString();
    }

    public static SharedPreferences getSharedPreferences(Context context) {
        if (mSharedPreferences == null) {
            mSharedPreferences = context.getSharedPreferences(Config.CONFIG_FILE_NAME, 0);
        }
        return mSharedPreferences;
    }

    public static SharedPreferences.Editor getSharedPreferencesEditor(Context context) {
        if (mSharedPreferencesEditor == null) {
            mSharedPreferencesEditor = getSharedPreferences(context).edit();
        }
        return mSharedPreferencesEditor;
    }

    public static String getSharedPreferencesString(Context context, String str, String str2) {
        return getSharedPreferences(context).getString(str, str2);
    }

    public static void putSharedPreferencesString(Context context, String str, String str2) {
        SharedPreferences.Editor sharedPreferencesEditor = getSharedPreferencesEditor(context);
        sharedPreferencesEditor.putString(str, str2);
        sharedPreferencesEditor.commit();
    }

    public static String getListString(List list) {
        return list == null ? "null" : Arrays.toString(list.toArray());
    }

    public static void startWiFiActivity(Context context) {
        Intent intent = new Intent();
        intent.setClass(context, WiFiActivity.class);
        intent.addFlags(268435456);
        context.startActivity(intent);
    }

    public static void startService(Context context, String str) {
        Intent intent = new Intent();
        intent.setClass(context, MainService.class);
        intent.putExtra(MainService.KE_COMMAND, str);
        context.startService(intent);
    }
}
