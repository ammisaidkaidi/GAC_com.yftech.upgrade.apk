package com.yftech.upgrade.app;

import android.app.Application;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.yftech.upgrade.callback.IUICallback;
import com.yftech.upgrade.data.DataProvider;
import com.yftech.upgrade.data.TaskState;
import com.yftech.upgrade.manager.UpgradeManagerGlobal;
import com.yftech.upgrade.manager.WiFiManagerGlobal;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: /home/user/work/dex/classes.dex */
public class MainApplication extends Application {
    private static MainApplication mMainApplication;
    private String TAG = "MainApplication";
    private Object mLock = new Object();
    private ArrayList<IUICallback> mUICallbacks = new ArrayList<>();
    private Handler mHandler = new Handler() { // from class: com.yftech.upgrade.app.MainApplication.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            super.handleMessage(message);
        }
    };

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        Log.i(this.TAG, "onCreate: ");
        mMainApplication = this;
        DataProvider.getInstance().parseDownloadRecord(this);
        UpgradeManagerGlobal.getInstance().init(this);
        WiFiManagerGlobal.getInstance().init(this);
    }

    @Override // android.app.Application
    public void onTerminate() {
        UpgradeManagerGlobal.getInstance().release();
        super.onTerminate();
    }

    public static MainApplication getMainApplication() {
        return mMainApplication;
    }

    public void registerUiCallback(IUICallback iUICallback) {
        synchronized (this.mLock) {
            if (!this.mUICallbacks.contains(iUICallback)) {
                this.mUICallbacks.add(iUICallback);
            }
        }
    }

    public void unregisterUiCallback(IUICallback iUICallback) {
        synchronized (this.mLock) {
            this.mUICallbacks.remove(iUICallback);
        }
    }

    public void notifyUpgradeStateChanged(final TaskState taskState) {
        synchronized (this.mLock) {
            Iterator<IUICallback> it = this.mUICallbacks.iterator();
            while (it.hasNext()) {
                final IUICallback next = it.next();
                this.mHandler.post(new Runnable() { // from class: com.yftech.upgrade.app.MainApplication.2
                    @Override // java.lang.Runnable
                    public void run() {
                        next.onUpgradeStateChanged(taskState);
                    }
                });
            }
        }
    }

    public void notifyDownloadStateChanged(final TaskState taskState) {
        synchronized (this.mLock) {
            Iterator<IUICallback> it = this.mUICallbacks.iterator();
            while (it.hasNext()) {
                final IUICallback next = it.next();
                this.mHandler.post(new Runnable() { // from class: com.yftech.upgrade.app.MainApplication.3
                    @Override // java.lang.Runnable
                    public void run() {
                        next.onDownloadStateChanged(taskState);
                    }
                });
            }
        }
    }
}
