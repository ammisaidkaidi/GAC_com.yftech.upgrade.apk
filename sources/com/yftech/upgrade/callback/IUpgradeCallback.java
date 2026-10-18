package com.yftech.upgrade.callback;

import com.yftech.upgrade.data.TaskState;
import com.yftech.upgrade.data.UpgradeInfo;

/* loaded from: /home/user/work/dex/classes.dex */
public interface IUpgradeCallback {
    void onUpgradeChanged(UpgradeInfo upgradeInfo);

    default void onUpgradeProgress(int i, int i2) {
    }

    default void onUpgradeState(int i, int i2) {
    }

    default void onUpgradeState(TaskState taskState) {
    }
}
