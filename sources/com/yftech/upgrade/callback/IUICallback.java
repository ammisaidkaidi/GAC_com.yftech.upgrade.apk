package com.yftech.upgrade.callback;

import com.yftech.upgrade.data.TaskState;

/* loaded from: /home/user/work/dex/classes.dex */
public interface IUICallback {
    default void onDownloadStateChanged(TaskState taskState) {
    }

    default void onUpgradeStateChanged(TaskState taskState) {
    }
}
