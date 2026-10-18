package androidx.appcompat.widget;

import android.graphics.Rect;

/* loaded from: /home/user/work/dex/classes.dex */
public interface FitWindowsViewGroup {

    /* loaded from: /home/user/work/dex/classes.dex */
    public interface OnFitSystemWindowsListener {
        void onFitSystemWindows(Rect rect);
    }

    void setOnFitSystemWindowsListener(OnFitSystemWindowsListener onFitSystemWindowsListener);
}
