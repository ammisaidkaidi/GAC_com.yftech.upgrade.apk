package com.yftech.upgrade.app;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.ServiceManager;
import android.util.Log;
import com.google.gson.reflect.TypeToken;
import com.yftech.upgrade.R;
import com.yftech.upgrade.callback.IDownloadListener;
import com.yftech.upgrade.callback.IUpgradeCallback;
import com.yftech.upgrade.data.DataProvider;
import com.yftech.upgrade.data.DownloadRecord;
import com.yftech.upgrade.data.HttpRequestCell;
import com.yftech.upgrade.data.HttpRespondCell;
import com.yftech.upgrade.data.TaskState;
import com.yftech.upgrade.data.UpgradeInfo;
import com.yftech.upgrade.manager.CarStateManager;
import com.yftech.upgrade.manager.DownloadManager;
import com.yftech.upgrade.manager.UpgradeManagerGlobal;
import com.yftech.upgrade.utils.FileUtils;
import com.yftech.upgrade.utils.JsonHelper;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: /home/user/work/dex/classes.dex */
public class MainService extends Service {
    public static final String COMMAND_HIDE = "hide";
    public static final String COMMAND_REQUEST_DOWNLOAD = "request_download";
    public static final String COMMAND_REQUEST_UPGRADE = "request_upgrade";
    public static final String COMMAND_REQUEST_VERSION = "request_version";
    public static final String COMMAND_SHOW = "show";
    public static final String KE_COMMAND = "command";
    private UpgradeViewManager mUpgradeViewManager;
    private String TAG = "MainService";
    private Object mLock = new Object();
    private IDownloadListener mDownloadCallback = new IDownloadListener() { // from class: com.yftech.upgrade.app.MainService.1
        @Override // com.yftech.upgrade.callback.IDownloadListener
        public void onDownloadPositionChanged(TaskState taskState) {
        }

        @Override // com.yftech.upgrade.callback.IDownloadListener
        public void onDownloadStateChanged(TaskState taskState) {
            Log.i(MainService.this.TAG, "onDownloadStateChanged: " + taskState);
            if (2 != taskState.getState()) {
                taskState.getState();
            }
            if (1 == taskState.getType()) {
                MainService.this.updateRequestState(taskState);
            } else if (2 == taskState.getType()) {
                MainService.this.updateDownloadState(taskState);
            }
            MainService.this.notifyDownloadStateChanged();
        }
    };
    private IUpgradeCallback mUpgradeCallback = new IUpgradeCallback() { // from class: com.yftech.upgrade.app.MainService.3
        @Override // com.yftech.upgrade.callback.IUpgradeCallback
        public void onUpgradeChanged(UpgradeInfo upgradeInfo) {
            if (1 != upgradeInfo.getStatus()) {
                upgradeInfo.getStatus();
            }
            MainService.this.notifyUpgradeStateChanged();
        }

        @Override // com.yftech.upgrade.callback.IUpgradeCallback
        public void onUpgradeProgress(int i, int i2) {
            TaskState taskState = DataProvider.getInstance().getTaskState();
            taskState.setPosition(i2);
            taskState.setDuration(1000L);
            MainService.this.notifyUpgradeStateChanged();
        }

        @Override // com.yftech.upgrade.callback.IUpgradeCallback
        public void onUpgradeState(int i, int i2) {
            TaskState taskState = DataProvider.getInstance().getTaskState();
            taskState.setModule(i);
            taskState.setUpdateStatus(i2);
            MainService.this.notifyUpgradeStateChanged();
        }

        @Override // com.yftech.upgrade.callback.IUpgradeCallback
        public void onUpgradeState(TaskState taskState) {
            TaskState taskState2 = DataProvider.getInstance().getTaskState();
            taskState2.setState(taskState.getState());
            taskState2.setMessage(taskState.getMessage());
        }
    };

    public Context getContext() {
        return this;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return new Binder();
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mUpgradeViewManager = new UpgradeViewManager(this);
        DownloadManager.getInstance().registerListen(this.mDownloadCallback, null);
        UpgradeManagerGlobal.getInstance().addCallback(this.mUpgradeCallback);
        ServiceManager.addService("upgrade_ota", new Binder());
        checkContinueDownload();
    }

    @Override // android.app.Service
    protected void dump(FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        Log.d(this.TAG, "dump: ");
        printWriter.println("#### UpgradeService ####");
        if (strArr != null && strArr.length > 0) {
            String str = strArr[0];
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(DataProvider.getInstance().toString());
        stringBuffer.append("\n\n###########################\n");
        printWriter.println(stringBuffer.toString());
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        parseCommand(intent);
        return super.onStartCommand(intent, i, i2);
    }

    private void parseCommand(Intent intent) {
        if (intent == null) {
            Log.e(this.TAG, "parseCommand: intent is null");
            return;
        }
        String stringExtra = intent.getStringExtra(KE_COMMAND);
        Log.i(this.TAG, "parseCommand: " + stringExtra);
        if (COMMAND_REQUEST_VERSION.equals(stringExtra)) {
            this.mUpgradeViewManager.show(getContext());
            requestVersion();
            return;
        }
        if (COMMAND_REQUEST_DOWNLOAD.equals(stringExtra)) {
            this.mUpgradeViewManager.show(getContext());
            requestDownload();
        } else if (COMMAND_REQUEST_UPGRADE.equals(stringExtra)) {
            this.mUpgradeViewManager.show(getContext());
            startUpgrade();
        } else if (COMMAND_SHOW.equals(stringExtra)) {
            this.mUpgradeViewManager.show(getContext());
        } else if (COMMAND_HIDE.equals(stringExtra)) {
            this.mUpgradeViewManager.remove(getContext());
        }
    }

    public void startUpgrade() {
        if (!CarStateManager.getInstance().isParking()) {
            this.mUpgradeViewManager.updateParking();
            return;
        }
        if (DataProvider.getInstance().isTaskBusying()) {
            Log.w(this.TAG, "startUpgrade, busy: " + DataProvider.getInstance().getTaskState());
            return;
        }
        TaskState taskState = DataProvider.getInstance().getTaskState();
        taskState.setType(3);
        if (!DataProvider.getInstance().isDownloadFinish()) {
            Log.w(this.TAG, "startUpgrade: isDownloadFinish false");
            taskState.setState(1);
            taskState.setMessage(getContext().getString(R.string.download_error_not_download));
            notifyUpgradeStateChanged();
            return;
        }
        if (DataProvider.getInstance().isLatestVersion()) {
            Log.w(this.TAG, "startUpgrade: isLatestVersion");
            taskState.setState(2);
            taskState.setMessage(getContext().getString(R.string.latest_upgrade));
            notifyUpgradeStateChanged();
            return;
        }
        if (!DataProvider.getInstance().isRequestVersion() && !DataProvider.getInstance().hasDownloadRecord()) {
            Log.w(this.TAG, "startUpgrade: isRequestVersion false");
            taskState.setState(1);
            taskState.setMessage(getContext().getString(R.string.no_get_version));
            notifyUpgradeStateChanged();
            return;
        }
        taskState.setState(3);
        UpgradeManagerGlobal.getInstance().setUpgradeModule();
    }

    public void requestVersion() {
        if (DataProvider.getInstance().isTaskBusying()) {
            Log.w(this.TAG, "requestVersion, busy: " + DataProvider.getInstance().getTaskState());
            return;
        }
        TaskState taskState = DataProvider.getInstance().getTaskState();
        taskState.setType(1);
        HttpRequestCell httpRequestCell = new HttpRequestCell();
        httpRequestCell.updateVersion();
        taskState.setState(3);
        DataProvider.getInstance().resetRespond();
        DownloadManager.getInstance().requestVersion(httpRequestCell, taskState.getTypeString());
    }

    private void checkContinueDownload() {
        Log.i(this.TAG, "checkContinueDownload: ");
        if (!DataProvider.getInstance().hasDownloadRecord() || DataProvider.getInstance().isDownloadFinish()) {
            return;
        }
        Log.i(this.TAG, "checkContinueDownload: requestDownload");
        requestDownload();
    }

    public void requestDownload() {
        if (DataProvider.getInstance().isTaskBusying()) {
            Log.w(this.TAG, "requestDownload, busy: " + DataProvider.getInstance().getTaskState());
            return;
        }
        TaskState taskState = DataProvider.getInstance().getTaskState();
        taskState.setType(2);
        if (DataProvider.getInstance().isLatestVersion()) {
            Log.w(this.TAG, "requestDownload: isLatestVersion");
            taskState.setState(2);
            taskState.setMessage(getContext().getString(R.string.latest_upgrade));
            taskState.setPosition(100L);
            taskState.setDuration(100L);
            notifyDownloadStateChanged();
            return;
        }
        if (DataProvider.getInstance().hasDownloadRecord() && DataProvider.getInstance().isDownloadFinish()) {
            Log.w(this.TAG, "requestDownload: isDownloadFinish");
            taskState.setState(2);
            taskState.setMessage(getContext().getString(R.string.download_already_finish));
            taskState.setPosition(100L);
            taskState.setDuration(100L);
            notifyDownloadStateChanged();
            return;
        }
        if (!DataProvider.getInstance().hasDownloadRecord() && !DataProvider.getInstance().isRequestVersion()) {
            Log.w(this.TAG, "requestDownload: isRequestVersion false");
            taskState.setState(1);
            taskState.setMessage(getContext().getString(R.string.no_get_version));
            taskState.setPosition(100L);
            taskState.setDuration(100L);
            notifyDownloadStateChanged();
            return;
        }
        DownloadRecord popDownloadTask = DataProvider.getInstance().popDownloadTask(false);
        Log.i(this.TAG, "requestDownload, record: " + popDownloadTask);
        if (popDownloadTask == null) {
            taskState.setMessage(getContext().getString(R.string.download_error_no_files));
            taskState.setState(2);
            notifyDownloadStateChanged();
        } else {
            taskState.setModule(popDownloadTask.getModule());
            taskState.setState(3);
            taskState.setErrorCode(0);
            DownloadManager.getInstance().requestDownload(popDownloadTask, taskState.getTypeString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyDownloadStateChanged() {
        MainApplication.getMainApplication().notifyDownloadStateChanged(DataProvider.getInstance().getTaskState());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyUpgradeStateChanged() {
        MainApplication.getMainApplication().notifyUpgradeStateChanged(DataProvider.getInstance().getTaskState());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateRequestState(TaskState taskState) {
        TaskState taskState2 = DataProvider.getInstance().getTaskState();
        taskState2.setState(taskState.getState());
        taskState2.setMessage(taskState.getMessage());
        taskState2.setErrorCode(taskState.getErrorCode());
        if (2 == taskState.getState()) {
            DataProvider.getInstance().setVersionRespond((HttpRespondCell) JsonHelper.fromJson(taskState2.getMessage(), new TypeToken<HttpRespondCell>() { // from class: com.yftech.upgrade.app.MainService.2
            }.getType()));
            ArrayList<DownloadRecord> downloadRecords = DataProvider.getInstance().getDownloadRecords();
            if (downloadRecords.size() == 0) {
                return;
            }
            new StringBuffer();
            Iterator<DownloadRecord> it = downloadRecords.iterator();
            while (it.hasNext()) {
                FileUtils.getFileName(it.next().getModule(), false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateDownloadState(TaskState taskState) {
        TaskState taskState2 = DataProvider.getInstance().getTaskState();
        taskState2.setDuration(taskState.getDuration());
        taskState2.setPosition(taskState.getPosition());
        taskState2.setState(taskState.getState());
        taskState2.setMessage(taskState.getMessage());
        taskState2.setErrorCode(taskState.getErrorCode());
        if (1 != taskState.getState() && 2 == taskState.getState()) {
            DownloadRecord popDownloadTask = DataProvider.getInstance().popDownloadTask(true);
            if (popDownloadTask != null) {
                popDownloadTask.setDownloadCode(2);
                DataProvider.getInstance().updateDownloadRecord(popDownloadTask);
            }
            if (DataProvider.getInstance().popDownloadTask(false) == null) {
                Log.d(this.TAG, "updateDownloadState: " + DataProvider.getInstance().toString());
                return;
            }
            requestDownload();
        }
    }
}
