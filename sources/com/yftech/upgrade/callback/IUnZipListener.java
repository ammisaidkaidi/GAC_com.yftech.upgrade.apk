package com.yftech.upgrade.callback;

/* loaded from: /home/user/work/dex/classes.dex */
public interface IUnZipListener {
    void onUnZipEnd(int i);

    void onUnZipProgress(long j, long j2, String str);

    void onUnZipStart();
}
