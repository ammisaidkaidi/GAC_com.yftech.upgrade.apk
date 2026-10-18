package com.yftech.upgrade.app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.upgrade.utils.Utils;

/* loaded from: /home/user/work/dex/classes.dex */
public class MainReceiver extends BroadcastReceiver {
    private static final String TAG = "MainReceiver";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent == null) {
            Log.i(TAG, "intent is null");
            return;
        }
        String action = intent.getAction();
        if (TextUtils.isEmpty(action)) {
            Log.i(TAG, "action is null");
            return;
        }
        Log.i(TAG, "action is:" + action);
        if ("android.intent.action.BOOT_COMPLETED".equals(action)) {
            Utils.startService(context, "");
        }
    }
}
