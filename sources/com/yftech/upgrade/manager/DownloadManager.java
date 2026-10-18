package com.yftech.upgrade.manager;

import android.os.Handler;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import com.yftech.upgrade.app.MainApplication;
import com.yftech.upgrade.callback.IDownloadListener;
import com.yftech.upgrade.data.Config;
import com.yftech.upgrade.data.DataProvider;
import com.yftech.upgrade.data.DownloadRecord;
import com.yftech.upgrade.data.HttpRequestCell;
import com.yftech.upgrade.data.TaskState;
import com.yftech.upgrade.utils.FileUtils;
import com.yftech.upgrade.utils.JsonHelper;
import com.yftech.upgrade.utils.OKHttp3Utils;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import okhttp3.Call;
import okhttp3.Response;
import okhttp3.ResponseBody;

/* loaded from: /home/user/work/dex/classes.dex */
public class DownloadManager {
    public static final int RESPOND_CODE_SUCCESS = 200;
    private static DownloadManager mInstance;
    private String TAG = "DownloadManager";
    private ArrayList<IDownloadListener> mCallbackList = new ArrayList<>();
    private HashMap<String, Call> mRequestCalls = new HashMap<>();
    private Object mLock = new Object();
    private IDownloadListener mHttpCallback = new IDownloadListener() { // from class: com.yftech.upgrade.manager.DownloadManager.1
        @Override // com.yftech.upgrade.callback.IDownloadListener, okhttp3.Callback
        public void onResponse(Call call, Response response) throws IOException {
            Log.i(DownloadManager.this.TAG, "onResponse: " + call + "," + response);
            TaskState taskState = new TaskState();
            StringBuffer stringBuffer = new StringBuffer();
            taskState.setType(1);
            taskState.setState(1);
            if (200 == response.code()) {
                String string = response.body().string();
                Log.i(DownloadManager.this.TAG, "response, responseBody:" + string);
                stringBuffer.append(string);
                taskState.setState(2);
            } else {
                stringBuffer.append("onResponse error, code:" + response.code() + ", please check it:" + response);
            }
            taskState.setMessage(stringBuffer.toString());
            DownloadManager.this.notifyDownloadStateChanged(taskState);
        }

        @Override // com.yftech.upgrade.callback.IDownloadListener, okhttp3.Callback
        public void onFailure(Call call, IOException iOException) {
            Log.i(DownloadManager.this.TAG, "onDownloadFileFailure1: " + call + "\n" + iOException.toString());
            StringBuilder sb = new StringBuilder();
            sb.append(call.toString());
            sb.append("\n");
            sb.append(iOException.toString());
            StringBuffer stringBuffer = new StringBuffer(sb.toString());
            TaskState taskState = new TaskState();
            taskState.setType(1);
            taskState.setState(1);
            taskState.setMessage(stringBuffer.toString());
            DownloadManager.this.notifyDownloadStateChanged(taskState);
        }
    };
    private IDownloadListener mHttpDownloadCallback = new IDownloadListener() { // from class: com.yftech.upgrade.manager.DownloadManager.2
        long timeStamp = SystemClock.elapsedRealtime();
        long timeTemp = this.timeStamp;
        long fileLength = 0;

        @Override // com.yftech.upgrade.callback.IDownloadListener
        public void onFileChanged(int i, long j, long j2) {
            long elapsedRealtime = SystemClock.elapsedRealtime();
            if (elapsedRealtime - this.timeTemp >= 1000) {
                this.timeTemp = elapsedRealtime;
                Log.i(DownloadManager.this.TAG, "onFileChanged: " + (j - this.fileLength));
                this.fileLength = 0L;
            } else if (0 == this.fileLength) {
                this.fileLength = j;
            }
            if (j == j2) {
                this.fileLength = 0L;
            }
            TaskState taskState = new TaskState();
            taskState.setType(2);
            taskState.setState(3);
            taskState.setPosition(j);
            taskState.setDuration(j2);
            DownloadManager.this.notifyDownloadPositionChanged(taskState);
            DownloadManager.this.notifyDownloadStateChanged(taskState);
        }

        @Override // com.yftech.upgrade.callback.IDownloadListener, okhttp3.Callback
        public void onResponse(Call call, Response response) throws IOException {
            Log.i(DownloadManager.this.TAG, "onResponse: " + call + "," + response);
            StringBuffer stringBuffer = new StringBuffer();
            TaskState taskState = new TaskState();
            taskState.setType(2);
            if (response.isSuccessful()) {
                taskState.setState(2);
                DownloadManager.this.writeFiles(response);
                return;
            }
            taskState.setState(1);
            stringBuffer.append("onResponse error, code:" + response.code() + ", please check it:" + response);
            taskState.setMessage(stringBuffer.toString());
            DownloadManager.this.notifyDownloadStateChanged(taskState);
        }

        @Override // com.yftech.upgrade.callback.IDownloadListener, okhttp3.Callback
        public void onFailure(Call call, IOException iOException) {
            Log.i(DownloadManager.this.TAG, "onDownloadFileFailure2: " + call + "\n" + iOException.toString());
            StringBuilder sb = new StringBuilder();
            sb.append(call.toString());
            sb.append("\n");
            sb.append(iOException.toString());
            StringBuffer stringBuffer = new StringBuffer(sb.toString());
            TaskState taskState = new TaskState();
            taskState.setType(2);
            taskState.setState(1);
            taskState.setMessage(stringBuffer.toString());
            DownloadManager.this.notifyDownloadStateChanged(taskState);
        }
    };

    public static DownloadManager getInstance() {
        if (mInstance == null) {
            mInstance = new DownloadManager();
        }
        return mInstance;
    }

    private DownloadManager() {
    }

    public void registerListen(IDownloadListener iDownloadListener, Handler handler) {
        synchronized (this.mLock) {
            if (!this.mCallbackList.contains(iDownloadListener)) {
                this.mCallbackList.add(iDownloadListener);
            }
        }
    }

    public void unregisterListen(IDownloadListener iDownloadListener) {
        synchronized (this.mLock) {
            this.mCallbackList.remove(iDownloadListener);
        }
    }

    public void requestVersion(HttpRequestCell httpRequestCell, String str) {
        synchronized (this.mLock) {
            String json = JsonHelper.toJson(httpRequestCell);
            Log.i(this.TAG, "requestVersion, json: " + json);
            cancelCalls();
            TaskState taskState = new TaskState();
            taskState.setType(1);
            taskState.setState(3);
            taskState.setErrorCode(0);
            notifyDownloadStateChanged(taskState);
            Call postAsynHttp = OKHttp3Utils.getInstance().postAsynHttp(Config.buildAddress(), this.mHttpCallback, json, str);
            if (postAsynHttp != null) {
                this.mRequestCalls.put(str, postAsynHttp);
            } else {
                Log.e(this.TAG, "requestVersion: call is null");
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0099 A[Catch: all -> 0x00a8, TryCatch #0 {, blocks: (B:4:0x0003, B:6:0x001c, B:8:0x0028, B:9:0x0034, B:11:0x0048, B:13:0x0050, B:14:0x0063, B:17:0x0065, B:19:0x0099, B:20:0x00a6, B:22:0x009f, B:23:0x002d), top: B:3:0x0003 }] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x009f A[Catch: all -> 0x00a8, TryCatch #0 {, blocks: (B:4:0x0003, B:6:0x001c, B:8:0x0028, B:9:0x0034, B:11:0x0048, B:13:0x0050, B:14:0x0063, B:17:0x0065, B:19:0x0099, B:20:0x00a6, B:22:0x009f, B:23:0x002d), top: B:3:0x0003 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void requestDownload(DownloadRecord downloadRecord, String str) {
        long j;
        TaskState taskState;
        Call downAsynFile;
        synchronized (this.mLock) {
            cancelCalls();
            File file = new File(FileUtils.getFileName(downloadRecord.getModule(), false));
            if (file.exists()) {
                if (file.length() <= downloadRecord.getSize()) {
                    j = file.length();
                    taskState = new TaskState();
                    taskState.setType(2);
                    taskState.setState(3);
                    taskState.setErrorCode(0);
                    if (j <= 0 && j == downloadRecord.getSize()) {
                        Log.w(this.TAG, "requestDownload: download already finish");
                        taskState.setPosition(j);
                        taskState.setDuration(j);
                        taskState.setState(2);
                        notifyDownloadStateChanged(taskState);
                        return;
                    }
                    downloadRecord.setDownloadPoint(j);
                    Log.i(this.TAG, "requestDownload: " + downloadRecord);
                    taskState.setErrorCode(0);
                    notifyDownloadStateChanged(taskState);
                    downAsynFile = OKHttp3Utils.getInstance().downAsynFile(downloadRecord.getUrl(), this.mHttpDownloadCallback, downloadRecord.getDownloadPoint(), str);
                    if (downAsynFile == null) {
                        this.mRequestCalls.put(str, downAsynFile);
                    } else {
                        Log.e(this.TAG, "requestDownload: call is null");
                    }
                }
                file.length();
                downloadRecord.getSize();
            }
            j = 0;
            taskState = new TaskState();
            taskState.setType(2);
            taskState.setState(3);
            taskState.setErrorCode(0);
            if (j <= 0) {
            }
            downloadRecord.setDownloadPoint(j);
            Log.i(this.TAG, "requestDownload: " + downloadRecord);
            taskState.setErrorCode(0);
            notifyDownloadStateChanged(taskState);
            downAsynFile = OKHttp3Utils.getInstance().downAsynFile(downloadRecord.getUrl(), this.mHttpDownloadCallback, downloadRecord.getDownloadPoint(), str);
            if (downAsynFile == null) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyDownloadStateChanged(TaskState taskState) {
        synchronized (this.mLock) {
            Iterator<IDownloadListener> it = this.mCallbackList.iterator();
            while (it.hasNext()) {
                it.next().onDownloadStateChanged(taskState);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyDownloadPositionChanged(TaskState taskState) {
        synchronized (this.mLock) {
            Iterator<IDownloadListener> it = this.mCallbackList.iterator();
            while (it.hasNext()) {
                it.next().onDownloadPositionChanged(taskState);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeFiles(Response response) {
        ResponseBody body = response.body();
        TaskState taskState = new TaskState();
        taskState.setType(2);
        DownloadRecord popDownloadTask = DataProvider.getInstance().popDownloadTask(false);
        if (popDownloadTask == null) {
            Log.e(this.TAG, "writeFiles record is null");
            taskState.setPosition(100L);
            taskState.setState(1);
            taskState.setErrorCode(0);
            notifyDownloadStateChanged(taskState);
            return;
        }
        String fileName = FileUtils.getFileName(popDownloadTask.getModule(), false);
        long contentLength = body.getContentLength();
        long downloadPoint = popDownloadTask.getDownloadPoint();
        Log.i(this.TAG, "onResponse,fileLeftLength:" + contentLength + ",filePath:" + fileName + ",downloadPoint:" + downloadPoint);
        if (0 == downloadPoint) {
            deleteFiles(fileName);
        }
        deleteFiles(FileUtils.getFileName(popDownloadTask.getModule(), true));
        FileUtils.deleteSdcardBigFiles();
        if (FileUtils.isAvailableSize(MainApplication.getMainApplication(), Config.UPGRADE_DIR, contentLength)) {
            Log.i(this.TAG, "writeFiles: downloadFile");
            FileUtils.downloadFile(fileName, 8192, body, this.mHttpDownloadCallback, taskState);
            if (2 == taskState.getState()) {
                createMd5File(popDownloadTask);
                taskState.setPosition(100L);
            }
        } else {
            taskState.setState(1);
            taskState.setErrorCode(1);
        }
        notifyDownloadStateChanged(taskState);
    }

    public void createMd5File(DownloadRecord downloadRecord) {
        String fileName = FileUtils.getFileName(downloadRecord.getModule(), true);
        if (TextUtils.isEmpty(fileName)) {
            Log.e(this.TAG, "createMd5File: fileName is null");
            return;
        }
        Log.i(this.TAG, "createMd5File: " + fileName);
        FileUtils.writeFile(fileName, Config.FILE_BUFFER_SIZE, downloadRecord.getMd5());
    }

    public void deleteFiles(String str) {
        FileUtils.deleteFile(str, false);
    }

    public void cancelCalls() {
        synchronized (this.mLock) {
            for (Map.Entry<String, Call> entry : this.mRequestCalls.entrySet()) {
                entry.getValue().cancel();
                OKHttp3Utils.getInstance().cancelTag(entry.getKey());
            }
            this.mRequestCalls.clear();
        }
    }
}
