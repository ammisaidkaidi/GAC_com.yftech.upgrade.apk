package com.yftech.upgrade.app;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.yftech.upgrade.R;
import com.yftech.upgrade.callback.IUICallback;
import com.yftech.upgrade.data.DataProvider;
import com.yftech.upgrade.data.DownloadRecord;
import com.yftech.upgrade.data.TaskState;
import com.yftech.upgrade.manager.VersionManagerGlobal;
import com.yftech.upgrade.manager.WindowManagerGlobal;
import com.yftech.upgrade.utils.NoMultiClickListener;
import com.yftech.upgrade.utils.Utils;

/* loaded from: /home/user/work/dex/classes.dex */
public class UpgradeViewManager {
    public static final int TYPE_ECALL = 2057;
    private View mVersionViewRoot;
    private String TAG = "UpgradeViewManager";
    private IUICallback mCallback = new IUICallback() { // from class: com.yftech.upgrade.app.UpgradeViewManager.5
        @Override // com.yftech.upgrade.callback.IUICallback
        public void onDownloadStateChanged(TaskState taskState) {
            TaskState taskState2 = DataProvider.getInstance().getTaskState();
            if (1 == taskState2.getType()) {
                UpgradeViewManager.this.updateRequestState(taskState2);
            } else if (2 == taskState2.getType()) {
                UpgradeViewManager.this.updateDownloadState(taskState2);
            }
        }

        @Override // com.yftech.upgrade.callback.IUICallback
        public void onUpgradeStateChanged(TaskState taskState) {
            UpgradeViewManager.this.updateUpgrade(taskState);
        }
    };
    private WindowManagerGlobal mWindowManager = new WindowManagerGlobal();

    public UpgradeViewManager(Context context) {
        initViews(context);
    }

    public void initViews(final Context context) {
        this.mVersionViewRoot = LayoutInflater.from(context).inflate(R.layout.layout_version, (ViewGroup) null);
        this.mVersionViewRoot.findViewById(R.id.btn_check).setOnClickListener(new NoMultiClickListener() { // from class: com.yftech.upgrade.app.UpgradeViewManager.1
            @Override // com.yftech.upgrade.utils.NoMultiClickListener
            public void onNoMultiClick(View view) {
                Utils.startService(context, MainService.COMMAND_REQUEST_VERSION);
            }
        });
        this.mVersionViewRoot.findViewById(R.id.btn_upgrade).setOnClickListener(new NoMultiClickListener() { // from class: com.yftech.upgrade.app.UpgradeViewManager.2
            @Override // com.yftech.upgrade.utils.NoMultiClickListener
            public void onNoMultiClick(View view) {
                Utils.startService(context, MainService.COMMAND_REQUEST_UPGRADE);
            }
        });
        this.mVersionViewRoot.findViewById(R.id.btn_hide).setOnClickListener(new NoMultiClickListener() { // from class: com.yftech.upgrade.app.UpgradeViewManager.3
            @Override // com.yftech.upgrade.utils.NoMultiClickListener
            public void onNoMultiClick(View view) {
                TaskState taskState = DataProvider.getInstance().getTaskState();
                Log.i(UpgradeViewManager.this.TAG, "onNoMultiClick: " + taskState);
                if (3 == taskState.getState() && 3 == taskState.getType()) {
                    Log.w(UpgradeViewManager.this.TAG, "onNoMultiClick: now is upgrading, forbid any actions");
                } else {
                    UpgradeViewManager upgradeViewManager = UpgradeViewManager.this;
                    upgradeViewManager.remove(upgradeViewManager.getContext());
                }
            }
        });
        this.mVersionViewRoot.findViewById(R.id.btn_download).setOnClickListener(new NoMultiClickListener() { // from class: com.yftech.upgrade.app.UpgradeViewManager.4
            @Override // com.yftech.upgrade.utils.NoMultiClickListener
            public void onNoMultiClick(View view) {
                Utils.startService(context, MainService.COMMAND_REQUEST_DOWNLOAD);
            }
        });
    }

    public Context getContext() {
        return this.mVersionViewRoot.getContext();
    }

    private void updateCurrentVersion() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(String.format(getContext().getResources().getString(R.string.mcu_version_message), VersionManagerGlobal.getMcuVersion()) + "\n");
        VersionManagerGlobal.getDisplaySoftwareVersion();
        stringBuffer.append(String.format(getContext().getResources().getString(R.string.os_version_message), VersionManagerGlobal.getSystemVersion()) + "\n");
        ((TextView) this.mVersionViewRoot.findViewById(R.id.tv_version)).setText(stringBuffer.toString());
    }

    public void updateNewVersion(String str, boolean z) {
        TextView textView = (TextView) this.mVersionViewRoot.findViewById(R.id.tv_upgrade_version);
        textView.setText(str);
        textView.setTextColor(getContext().getColor(z ? R.color.color_normal : R.color.color_error));
    }

    public void setRightLayoutVisible(boolean z) {
        this.mVersionViewRoot.findViewById(R.id.linear_version_right).setVisibility(z ? 0 : 4);
    }

    public void setProgressTitle(String str) {
        ((TextView) this.mVersionViewRoot.findViewById(R.id.tv_task_title)).setText(str);
    }

    public void setProgressSubTitle(String str) {
        TextView textView = (TextView) this.mVersionViewRoot.findViewById(R.id.tv_task_sub_title);
        textView.setVisibility(0);
        textView.setText(str);
    }

    public void setProgressMessage(String str, boolean z) {
        TextView textView = (TextView) this.mVersionViewRoot.findViewById(R.id.tv_task_msg);
        textView.setVisibility(0);
        textView.setText(str);
        textView.setTextColor(getContext().getResources().getColor(!z ? R.color.color_error : R.color.color_normal));
    }

    private void setProgressVisible(boolean z) {
        this.mVersionViewRoot.findViewById(R.id.linear_progress).setVisibility(z ? 0 : 4);
    }

    public void setProgress(long j, long j2) {
        this.mVersionViewRoot.findViewById(R.id.linear_progress).setVisibility(0);
        TextView textView = (TextView) this.mVersionViewRoot.findViewById(R.id.tv_upgrade_progress);
        ProgressBar progressBar = (ProgressBar) this.mVersionViewRoot.findViewById(R.id.upgrade_progress_bar);
        progressBar.setVisibility(0);
        textView.setVisibility(0);
        progressBar.setProgress((int) j);
        progressBar.setMax((int) j2);
        textView.setText(j + "%");
    }

    public void updateParking() {
        setProgressTitle(getContext().getString(R.string.task_upgrade));
        setProgressSubTitle("");
        setProgressMessage(getContext().getString(R.string.upgrade_warning), false);
    }

    public void updateUpgrade(TaskState taskState) {
        String format;
        setProgressTitle(getContext().getString(R.string.task_upgrade));
        int module = taskState.getModule();
        String moduleName = TaskState.getModuleName(taskState.getModule());
        String str = "";
        if (module == 1) {
            switch (taskState.getUpdateStatus()) {
                case 1:
                    str = String.format(getContext().getString(R.string.upgrade_success), moduleName);
                    break;
                case 2:
                    str = String.format(getContext().getString(R.string.upgrade_failed), moduleName);
                    break;
                case 3:
                    setProgress(0L, 100L);
                    str = String.format(getContext().getString(R.string.upgrade_module), moduleName);
                    break;
                case 4:
                    str = String.format(getContext().getString(R.string.upgrade_copy), moduleName);
                    setProgress(taskState.getPosition(), 100L);
                    break;
                case 5:
                    str = String.format(getContext().getString(R.string.upgrade_verify), moduleName);
                    setProgress(taskState.getPosition(), 100L);
                    break;
                case 6:
                    str = String.format(getContext().getString(R.string.upgrade_module), moduleName);
                    setProgress(taskState.getPosition(), 100L);
                    break;
            }
        } else if (module == 2) {
            switch (taskState.getUpdateStatus()) {
                case 1:
                    format = String.format(getContext().getString(R.string.upgrade_success), moduleName);
                    break;
                case 2:
                    format = String.format(getContext().getString(R.string.upgrade_failed), moduleName);
                    break;
                case 3:
                    setProgress(0L, 100L);
                    format = String.format(getContext().getString(R.string.upgrade_module), moduleName);
                    break;
                case 4:
                    format = String.format(getContext().getString(R.string.upgrade_copy), moduleName);
                    setProgress(taskState.getPosition(), 100L);
                    break;
                case 5:
                    format = String.format(getContext().getString(R.string.upgrade_verify), moduleName);
                    setProgress(taskState.getPosition(), 100L);
                    break;
                case 6:
                    format = String.format(this.mVersionViewRoot.getContext().getString(R.string.upgrade_request), moduleName);
                    break;
                case 7:
                    format = String.format(getContext().getString(R.string.upgrade_module), moduleName);
                    setProgress(taskState.getPosition(), 100L);
                    break;
            }
            str = format;
        }
        if (-1 == taskState.getUpdateStatus()) {
            if (TextUtils.isEmpty(str)) {
                str = String.format(getContext().getString(R.string.upgrade_module), moduleName);
                setRightLayoutVisible(true);
            }
            if (2 == taskState.getState()) {
                setRightLayoutVisible(true);
                setProgress(100L, 100L);
                setProgressMessage(taskState.getMessage(), true);
                str = "SUCCESS";
            } else if (1 == taskState.getState()) {
                setRightLayoutVisible(true);
                setProgress(100L, 100L);
                setProgressMessage(taskState.getMessage(), false);
                str = "FAILED";
            }
        }
        setProgressSubTitle(str);
    }

    public void show(Context context) {
        Log.i(this.TAG, "show: ");
        this.mWindowManager.addView(context, this.mVersionViewRoot, TYPE_ECALL, 17, -1, -1, 8);
        MainApplication.getMainApplication().registerUiCallback(this.mCallback);
        init();
    }

    public void remove(Context context) {
        Log.i(this.TAG, "remove: ");
        this.mWindowManager.removeView(context, this.mVersionViewRoot);
        MainApplication.getMainApplication().unregisterUiCallback(this.mCallback);
    }

    private void init() {
        updateCurrentVersion();
        setRightLayoutVisible(false);
        TaskState taskState = DataProvider.getInstance().getTaskState();
        Log.i(this.TAG, "init: " + taskState);
        if (taskState == null) {
            return;
        }
        if (1 == taskState.getType()) {
            updateRequestState(taskState);
        } else if (2 == taskState.getType()) {
            updateDownloadState(taskState);
        } else if (3 == taskState.getType()) {
            updateUpgrade(taskState);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateRequestState(TaskState taskState) {
        String str;
        String str2 = "";
        setProgressSubTitle("");
        String string = getContext().getString(R.string.task_check_version);
        String parseVersionInfo = DataProvider.getInstance().parseVersionInfo(getContext());
        if (3 == taskState.getState()) {
            str = "" + getContext().getString(R.string.task_doing);
            setProgress(0L, 100L);
            setProgressVisible(true);
        } else if (2 == taskState.getState()) {
            updateNewVersion(parseVersionInfo, true);
            str = "" + getContext().getString(R.string.task_success);
            if (DataProvider.getInstance().getDownloadRecords().size() > 0) {
                DownloadRecord popDownloadTask = DataProvider.getInstance().popDownloadTask(false);
                if (popDownloadTask == null || (popDownloadTask.getSize() > 0 && popDownloadTask.getDownloadPoint() == popDownloadTask.getSize())) {
                    str2 = "\n" + getContext().getString(R.string.download_already_finish);
                }
            } else {
                str2 = getContext().getString(R.string.latest_upgrade);
            }
            setProgress(100L, 100L);
            setProgressVisible(true);
        } else if (1 == taskState.getState()) {
            setProgressVisible(false);
            updateNewVersion(parseVersionInfo, false);
            String str3 = "" + getContext().getString(R.string.task_failed);
            str = str3;
            str2 = taskState.getMessage() + "\n" + getContext().getString(R.string.try_again);
        } else {
            str = "";
        }
        setRightLayoutVisible(true);
        setProgressMessage(str2, 1 != taskState.getState());
        setProgressSubTitle(str);
        setProgressTitle(string);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateDownloadState(TaskState taskState) {
        setRightLayoutVisible(true);
        setProgressVisible(true);
        String string = getContext().getString(R.string.task_download);
        String message = taskState.getMessage();
        String str = String.format(getContext().getString(R.string.downloading_module), TaskState.getModuleName(taskState.getModule())) + "#";
        if (taskState.getState() == 0) {
            str = str + getContext().getString(R.string.task_doing);
            setProgress(taskState.getPosition(), taskState.getDuration());
        } else if (3 == taskState.getState()) {
            str = str + getContext().getString(R.string.task_doing);
            setProgress((long) (((((float) taskState.getPosition()) * 1.0f) / (((float) taskState.getDuration()) * 1.0f)) * 100.0d), 100L);
        } else if (2 == taskState.getState()) {
            str = str + getContext().getString(R.string.task_success);
            setProgress((long) (((((float) taskState.getPosition()) * 1.0f) / (((float) taskState.getDuration()) * 1.0f)) * 100.0d), 100L);
        } else if (1 == taskState.getState()) {
            str = str + getContext().getString(R.string.task_failed);
            if (1 == taskState.getErrorCode()) {
                message = getContext().getString(R.string.download_error_available_size) + "#" + message;
            } else if (TextUtils.isEmpty(message)) {
                message = getContext().getString(R.string.download_error_unknown) + "\n" + getContext().getString(R.string.try_again);
            }
            setProgress(taskState.getPosition(), taskState.getDuration());
        }
        setProgressMessage(message, 1 != taskState.getState());
        setProgressSubTitle(str);
        setProgressTitle(string);
    }
}
