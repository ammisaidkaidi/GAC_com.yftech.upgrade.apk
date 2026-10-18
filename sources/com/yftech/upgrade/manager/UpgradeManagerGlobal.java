package com.yftech.upgrade.manager;

import android.content.Context;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.car.upgrade.CarUpgradeManager;
import com.yftech.upgrade.R;
import com.yftech.upgrade.callback.IUpgradeCallback;
import com.yftech.upgrade.data.Config;
import com.yftech.upgrade.data.TaskState;
import com.yftech.upgrade.data.UpgradeInfo;
import com.yftech.upgrade.utils.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: /home/user/work/dex/classes.dex */
public class UpgradeManagerGlobal {
    private static UpgradeManagerGlobal mInstance;
    private Context mContext;
    private String TAG = "UpgradeManagerGlobal";
    private Handler mHandler = new Handler();
    private ArrayList<IUpgradeCallback> mCallbackList = new ArrayList<>();
    private CarUpgradeManager.CarUpgradeCallback mUpgradeCallback = new CarUpgradeManager.CarUpgradeCallback() { // from class: com.yftech.upgrade.manager.UpgradeManagerGlobal.5
        public void onUpgradeProgress(int i, int i2) {
            super.onUpgradeProgress(i, i2);
            Log.i(UpgradeManagerGlobal.this.TAG, "onUpgradeState,module: " + i + ",progress:" + i2);
            synchronized (UpgradeManagerGlobal.this.mUpgradeInfo) {
                UpgradeManagerGlobal.this.mUpgradeInfo.setProgress(i2);
                UpgradeManagerGlobal.this.notifyUpgradeInfoChanged(UpgradeManagerGlobal.this.mUpgradeInfo);
                UpgradeManagerGlobal.this.notifyUpgradeProgressChanged(i, i2);
            }
        }

        public void onUpgradeState(int i, int i2) {
            super.onUpgradeState(i, i2);
            Log.i(UpgradeManagerGlobal.this.TAG, "onUpgradeState,module: " + i + ",state:" + i2);
            synchronized (UpgradeManagerGlobal.this.mUpgradeInfo) {
                UpgradeManagerGlobal.this.mUpgradeInfo.setModule(i);
                UpgradeManagerGlobal.this.mUpgradeInfo.setStatus(i2);
                if (i == 1) {
                    UpgradeManagerGlobal.this.handlerOsUpgrade(i2);
                } else if (i == 2) {
                    UpgradeManagerGlobal.this.handlerMcuUpgrade(i2);
                }
                UpgradeManagerGlobal.this.notifyUpgradeInfoChanged(UpgradeManagerGlobal.this.mUpgradeInfo);
                UpgradeManagerGlobal.this.notifyUpgradeStateChanged(i, i2);
            }
        }
    };
    private UpgradeInfo mUpgradeInfo = new UpgradeInfo();

    /* JADX INFO: Access modifiers changed from: private */
    public void handlerMcuUpgrade(int i) {
        if (i == 1 || i == 2 || i == 4 || i == 5 || i != 6) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handlerOsUpgrade(int i) {
        if (i == 1 || i == 2 || i == 3 || i != 4) {
        }
    }

    public static UpgradeManagerGlobal getInstance() {
        if (mInstance == null) {
            mInstance = new UpgradeManagerGlobal();
        }
        return mInstance;
    }

    private UpgradeManagerGlobal() {
    }

    public void release() {
        CarUpgradeManager.getInstance().unregisterCarMCUUpgradeCallback(this.mUpgradeCallback);
        CarUpgradeManager.getInstance().unregisterCarOSUpgradeCallback(this.mUpgradeCallback);
        this.mHandler.removeCallbacksAndMessages(null);
    }

    public void init(Context context) {
        this.mContext = context;
        initUpgradePath();
        CarUpgradeManager.getInstance().registerCarMCUUpgradeCallback(this.mUpgradeCallback, this.mHandler);
        CarUpgradeManager.getInstance().registerCarOSUpgradeCallback(this.mUpgradeCallback, this.mHandler);
    }

    private void initUpgradePath() {
        File file = new File(Config.UPGRADE_DIR);
        Log.i(this.TAG, "initUpgradePath, getPath: " + file.getPath() + ",exists:" + file.exists() + ",getFreeSpace:" + file.getFreeSpace() + ",canRead:" + file.canRead());
        if (!file.exists()) {
            file.mkdirs();
        }
        File[] listFiles = file.listFiles();
        if (listFiles == null) {
            Log.e(this.TAG, "initUpgradePath: files is null");
            return;
        }
        for (File file2 : listFiles) {
            Log.i(this.TAG, "initUpgradePath file: " + file2.getName());
        }
    }

    public void setUpgradeModule() {
        TaskState taskState = new TaskState();
        String str = FileUtils.isMcuFileExist() ? Config.UPGRADE_DIR : "";
        String str2 = FileUtils.isOsFileExist() ? Config.UPGRADE_DIR : "";
        if (TextUtils.isEmpty(str) && TextUtils.isEmpty(str2)) {
            taskState.setState(1);
            taskState.setMessage(this.mContext.getString(R.string.upgrade_file_no_exist));
            notifyUpgradeStateChanged(taskState);
            return;
        }
        int addMCUUpgradeModule = !TextUtils.isEmpty(str) ? CarUpgradeManager.getInstance().addMCUUpgradeModule(str) : -1;
        int addOSUpgradeModule = TextUtils.isEmpty(str2) ? -1 : CarUpgradeManager.getInstance().addOSUpgradeModule(str2);
        Log.i(this.TAG, "startUpgrade, mcuCode: " + addMCUUpgradeModule + ",osCode:" + addOSUpgradeModule + ",mcuPath:" + str + ",osPath:" + str2);
        if (1 != addMCUUpgradeModule && 1 != addOSUpgradeModule) {
            taskState.setState(1);
            taskState.setMessage(this.mContext.getString(R.string.upgrade_add_file_failed));
            notifyUpgradeStateChanged(taskState);
        } else {
            taskState.setState(3);
            notifyUpgradeStateChanged(taskState);
            startUpgrade();
        }
    }

    public boolean startUpgrade() {
        TaskState taskState = new TaskState();
        boolean startUpgrade = CarUpgradeManager.getInstance().startUpgrade();
        Log.i(this.TAG, "startUpgrade, result: " + startUpgrade);
        if (!startUpgrade) {
            taskState.setState(1);
            notifyUpgradeStateChanged(taskState);
        }
        return startUpgrade;
    }

    public void addCallback(IUpgradeCallback iUpgradeCallback) {
        synchronized (this.mCallbackList) {
            if (!this.mCallbackList.contains(iUpgradeCallback)) {
                this.mCallbackList.add(iUpgradeCallback);
            }
        }
    }

    public void removeCallback(IUpgradeCallback iUpgradeCallback) {
        synchronized (this.mCallbackList) {
            this.mCallbackList.remove(iUpgradeCallback);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyUpgradeInfoChanged(final UpgradeInfo upgradeInfo) {
        synchronized (this.mCallbackList) {
            Iterator<IUpgradeCallback> it = this.mCallbackList.iterator();
            while (it.hasNext()) {
                final IUpgradeCallback next = it.next();
                this.mHandler.post(new Runnable() { // from class: com.yftech.upgrade.manager.UpgradeManagerGlobal.1
                    @Override // java.lang.Runnable
                    public void run() {
                        next.onUpgradeChanged(upgradeInfo);
                    }
                });
            }
        }
    }

    private void notifyUpgradeStateChanged(final TaskState taskState) {
        synchronized (this.mCallbackList) {
            Iterator<IUpgradeCallback> it = this.mCallbackList.iterator();
            while (it.hasNext()) {
                final IUpgradeCallback next = it.next();
                this.mHandler.post(new Runnable() { // from class: com.yftech.upgrade.manager.UpgradeManagerGlobal.2
                    @Override // java.lang.Runnable
                    public void run() {
                        next.onUpgradeState(taskState);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyUpgradeStateChanged(final int i, final int i2) {
        synchronized (this.mCallbackList) {
            Iterator<IUpgradeCallback> it = this.mCallbackList.iterator();
            while (it.hasNext()) {
                final IUpgradeCallback next = it.next();
                this.mHandler.post(new Runnable() { // from class: com.yftech.upgrade.manager.UpgradeManagerGlobal.3
                    @Override // java.lang.Runnable
                    public void run() {
                        next.onUpgradeState(i, i2);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyUpgradeProgressChanged(final int i, final int i2) {
        synchronized (this.mCallbackList) {
            Iterator<IUpgradeCallback> it = this.mCallbackList.iterator();
            while (it.hasNext()) {
                final IUpgradeCallback next = it.next();
                this.mHandler.post(new Runnable() { // from class: com.yftech.upgrade.manager.UpgradeManagerGlobal.4
                    @Override // java.lang.Runnable
                    public void run() {
                        next.onUpgradeProgress(i, i2);
                    }
                });
            }
        }
    }
}
