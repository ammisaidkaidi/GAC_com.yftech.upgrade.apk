package com.yftech.upgrade.manager;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;

/* loaded from: /home/user/work/dex/classes.dex */
public class WindowManagerGlobal {
    public static String TAG = "WindowManagerGlobal";

    public boolean addView(Context context, View view, int i, int i2, int i3, int i4, int i5) {
        WindowManager.LayoutParams layoutParams;
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        Log.i(TAG, "addView:" + view);
        if (windowManager != null && !view.isShown()) {
            WindowManager.LayoutParams createWindowManagerLayoutParams = createWindowManagerLayoutParams(i, i2, i3, i4);
            createWindowManagerLayoutParams.flags |= i5;
            windowManager.addView(view, createWindowManagerLayoutParams);
            return true;
        }
        if (windowManager == null || (layoutParams = (WindowManager.LayoutParams) view.getLayoutParams()) == null) {
            return false;
        }
        layoutParams.flags |= i5;
        windowManager.updateViewLayout(view, layoutParams);
        return false;
    }

    public WindowManager.LayoutParams createWindowManagerLayoutParams(int i, int i2, int i3, int i4) {
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams(2038, 524288);
        layoutParams.type = i;
        layoutParams.flags |= 8521472;
        layoutParams.format = 1;
        layoutParams.gravity = i2;
        layoutParams.width = i3;
        layoutParams.height = i4;
        return layoutParams;
    }

    public boolean removeView(Context context, View view) {
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        if (windowManager == null || view == null || !view.isShown()) {
            return false;
        }
        Log.i(TAG, "removeView:" + view);
        windowManager.removeView(view);
        return true;
    }
}
