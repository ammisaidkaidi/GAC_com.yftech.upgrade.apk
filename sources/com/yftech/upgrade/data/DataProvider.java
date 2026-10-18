package com.yftech.upgrade.data;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.google.gson.reflect.TypeToken;
import com.yftech.upgrade.R;
import com.yftech.upgrade.app.MainApplication;
import com.yftech.upgrade.data.HttpRespondCell;
import com.yftech.upgrade.utils.FileUtils;
import com.yftech.upgrade.utils.JsonHelper;
import com.yftech.upgrade.utils.Utils;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

/* loaded from: /home/user/work/dex/classes.dex */
public class DataProvider {
    private static final String KEY_DOWNLOAD_RECORD = "download_record";
    private static DataProvider mInstance;
    public HttpRespondCell mVersionRespond;
    private String TAG = "DataProvider";
    private Object mLock = new Object();
    private TaskState mTaskState = new TaskState();
    private ArrayList<DownloadRecord> mDownloadRecords = new ArrayList<>();
    private ArrayList<DownloadRecord> mDownloadTasks = new ArrayList<>();

    public static DataProvider getInstance() {
        if (mInstance == null) {
            mInstance = new DataProvider();
        }
        return mInstance;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("DataProvider{");
        if (this.mVersionRespond != null) {
            stringBuffer.append("respond=" + this.mVersionRespond.toString() + "\n");
        }
        stringBuffer.append("mTaskState=" + this.mTaskState.toString() + "\n");
        stringBuffer.append("mDownloadRecords=" + Utils.getListString(this.mDownloadRecords) + "\n");
        stringBuffer.append("mDownloadTasks=" + Utils.getListString(this.mDownloadTasks) + "\n");
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    public void resetRespond() {
        synchronized (this.mLock) {
            setVersionRespond(null);
        }
    }

    public HttpRespondCell getVersionRespond() {
        return this.mVersionRespond;
    }

    public void setVersionRespond(HttpRespondCell httpRespondCell) {
        synchronized (this.mLock) {
            this.mVersionRespond = httpRespondCell;
            parseDownloadTask(httpRespondCell);
        }
    }

    public ArrayList<DownloadRecord> getDownloadRecords() {
        ArrayList<DownloadRecord> arrayList;
        synchronized (this.mLock) {
            arrayList = this.mDownloadRecords;
        }
        return arrayList;
    }

    public boolean isRequestVersion() {
        return getVersionRespond() != null;
    }

    public boolean isLatestVersion() {
        synchronized (this.mLock) {
            if (isRequestVersion()) {
                return hasDownloadRecord() ? false : true;
            }
            return false;
        }
    }

    public boolean hasDownloadRecord() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mDownloadRecords.size() > 0;
        }
        return z;
    }

    public boolean isDownloadFinish() {
        synchronized (this.mLock) {
            Iterator<DownloadRecord> it = this.mDownloadRecords.iterator();
            while (it.hasNext()) {
                DownloadRecord next = it.next();
                if (3 == next.getDownloadCode()) {
                    return false;
                }
                if (2 == next.getDownloadCode() && next.getSize() > 0 && next.getSize() != next.getDownloadPoint()) {
                    Log.w(this.TAG, "isDownloadFinish: fix record data:" + next);
                    next.setDownloadCode(3);
                    return false;
                }
            }
            return true;
        }
    }

    private void parseDownloadTask(HttpRespondCell httpRespondCell) {
        synchronized (this.mLock) {
            this.mDownloadTasks.clear();
            if (this.mVersionRespond == null) {
                Log.w(this.TAG, "isValidVersion: respondCell is null");
                return;
            }
            if (this.mVersionRespond.data == null) {
                Log.w(this.TAG, "isValidVersion: respondCell.data is null");
                return;
            }
            if (this.mVersionRespond.data.list != null && this.mVersionRespond.data.list.size() != 0) {
                Iterator<HttpRespondCell.Item> it = httpRespondCell.data.list.iterator();
                while (it.hasNext()) {
                    parseDownloadRecord(it.next());
                }
                Log.d(this.TAG, "parseDownloadTask: " + toString());
                return;
            }
            Log.w(this.TAG, "isValidVersion: respondCell.data.list is null");
            this.mDownloadRecords.clear();
            saveDownloadRecord();
        }
    }

    private void parseDownloadRecord(HttpRespondCell.Item item) {
        Log.d(this.TAG, "parseDownloadRecord: " + item);
        synchronized (this.mLock) {
            if (!TextUtils.isEmpty(item.url) && !TextUtils.isEmpty(item.md5)) {
                if (item.size <= 0) {
                    Log.e(this.TAG, "parseDownloadRecord, size is error, add in record list: ");
                    return;
                }
                DownloadRecord downloadRecord = null;
                DownloadRecord createDownloadRecord = createDownloadRecord(item);
                Iterator<DownloadRecord> it = this.mDownloadRecords.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    DownloadRecord next = it.next();
                    if (next.getDeviceId() == item.deviceId) {
                        String fileName = FileUtils.getFileName(next.getModule(), false);
                        File file = new File(fileName);
                        if (item.md5.equals(next.getMd5())) {
                            if (!file.exists()) {
                                next.setDownloadCode(3);
                                this.mDownloadRecords.remove(next);
                                Log.w(this.TAG, "parseDownloadRecord: already finish download, but file is removed, download again");
                            } else if (next.getSize() != item.size) {
                                next.setDownloadCode(3);
                                FileUtils.deleteFile(fileName, false);
                                this.mDownloadRecords.remove(next);
                                Log.w(this.TAG, "parseDownloadRecord: file size not equals, download again");
                            } else {
                                next.setDownloadPoint(file.length());
                                if (file.length() == next.getSize()) {
                                    next.setDownloadCode(2);
                                } else {
                                    next.setDownloadCode(3);
                                }
                                Log.i(this.TAG, "parseDownloadRecord: add download:" + fileName);
                                this.mDownloadTasks.add(next);
                                downloadRecord = next;
                            }
                        } else {
                            Log.e(this.TAG, "parseDownloadRecord, url or md5 is not same, add in record list: ");
                            this.mDownloadRecords.remove(next);
                        }
                    }
                }
                if (downloadRecord == null) {
                    this.mDownloadRecords.add(createDownloadRecord);
                    this.mDownloadTasks.add(createDownloadRecord);
                    FileUtils.deleteFile(FileUtils.getFileName(createDownloadRecord.getModule(), false), false);
                }
                saveDownloadRecord();
                return;
            }
            Log.e(this.TAG, "parseDownloadRecord: url or md5 is null, ignore");
        }
    }

    public void addDownloadRecord(DownloadRecord downloadRecord) {
        this.mDownloadTasks.add(downloadRecord);
    }

    private DownloadRecord createDownloadRecord(HttpRespondCell.Item item) {
        DownloadRecord downloadRecord = new DownloadRecord();
        downloadRecord.setMd5(item.md5);
        downloadRecord.setUrl(item.url);
        downloadRecord.setNewVer(item.newVer);
        downloadRecord.setSize(item.size);
        downloadRecord.setDeviceId(item.deviceId);
        downloadRecord.setDownloadCode(3);
        return downloadRecord;
    }

    public String parseVersionInfo(Context context) {
        String stringBuffer;
        synchronized (this.mLock) {
            StringBuffer stringBuffer2 = new StringBuffer();
            HttpRespondCell httpRespondCell = this.mVersionRespond;
            ProjectInfo projectInfo = ProjectManager.mInstance.getProjectInfo();
            if (httpRespondCell != null) {
                if (httpRespondCell.data != null) {
                    if (httpRespondCell.data.list != null && httpRespondCell.data.list.size() > 0) {
                        for (HttpRespondCell.Item item : httpRespondCell.data.list) {
                            if (projectInfo.getOSDeviceId() == item.deviceId) {
                                stringBuffer2.append(String.format(context.getString(R.string.os_version_message), item.newVer) + "\n");
                            } else if (projectInfo.getMcuDeviceId() == item.deviceId) {
                                stringBuffer2.append(String.format(context.getString(R.string.mcu_version_message), item.newVer) + "\n");
                            } else {
                                stringBuffer2.append("deviceId:" + item.deviceId + "\n");
                                stringBuffer2.append("newVer:" + item.newVer + "\n");
                            }
                            stringBuffer2.append("notes:" + item.notes + "\n");
                            stringBuffer2.append("size:" + item.size + "\n");
                            try {
                                TimeZone timeZone = TimeZone.getDefault();
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                simpleDateFormat.setTimeZone(timeZone);
                                stringBuffer2.append("createdAt:" + simpleDateFormat.format(new Date(item.createdAt * 1000)));
                                stringBuffer2.append("\n");
                                stringBuffer2.append("\n");
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
                        Log.w(this.TAG, "parseVersionInfo: httpRespondCell.data.list is null");
                    }
                } else {
                    Log.w(this.TAG, "parseVersionInfo: httpRespondCell is null");
                }
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    public DownloadRecord popDownloadTask(boolean z) {
        DownloadRecord downloadRecord;
        synchronized (this.mLock) {
            downloadRecord = null;
            if (this.mDownloadTasks.size() > 0) {
                if (z) {
                    downloadRecord = this.mDownloadTasks.remove(0);
                } else {
                    downloadRecord = this.mDownloadTasks.get(0);
                }
            }
        }
        return downloadRecord;
    }

    public TaskState getTaskState() {
        return this.mTaskState;
    }

    public boolean isTaskBusying() {
        boolean z;
        synchronized (this.mLock) {
            z = 3 == this.mTaskState.getState();
        }
        return z;
    }

    public void updateDownloadRecord(DownloadRecord downloadRecord) {
        synchronized (this.mLock) {
            Iterator<DownloadRecord> it = this.mDownloadRecords.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                DownloadRecord next = it.next();
                if (next.getDeviceId() == downloadRecord.getDeviceId()) {
                    next.setDownloadCode(downloadRecord.getDownloadCode());
                    next.setDownloadPoint(downloadRecord.getSize());
                    break;
                }
            }
            saveDownloadRecord();
        }
    }

    public void parseDownloadRecord(Context context) {
        synchronized (this.mLock) {
            this.mDownloadRecords.clear();
            try {
                String sharedPreferencesString = Utils.getSharedPreferencesString(context, KEY_DOWNLOAD_RECORD, "");
                Log.i(this.TAG, "parseDownloadRecord: " + sharedPreferencesString);
                ArrayList arrayList = (ArrayList) JsonHelper.fromJson(sharedPreferencesString, new TypeToken<List<DownloadRecord>>() { // from class: com.yftech.upgrade.data.DataProvider.1
                }.getType());
                if (arrayList != null && arrayList.size() > 0) {
                    this.mDownloadRecords.addAll(arrayList);
                }
                if (this.mDownloadRecords.size() > 2) {
                    Log.e(this.TAG, "parseDownloadRecord, this is error data, reset list");
                    this.mDownloadRecords.clear();
                }
                Iterator<DownloadRecord> it = this.mDownloadRecords.iterator();
                while (it.hasNext()) {
                    DownloadRecord next = it.next();
                    if (3 == next.getDownloadCode()) {
                        this.mDownloadTasks.add(next);
                    }
                }
                Log.i(this.TAG, "parseDownloadRecord, result: " + Arrays.toString(this.mDownloadRecords.toArray()));
            } catch (Exception e) {
                e.printStackTrace();
            }
            saveDownloadRecord();
        }
    }

    private void saveDownloadRecord() {
        synchronized (this.mLock) {
            Log.i(this.TAG, "saveDownloadRecord, size: " + this.mDownloadRecords.size());
            Utils.putSharedPreferencesString(MainApplication.getMainApplication(), KEY_DOWNLOAD_RECORD, JsonHelper.toJson(this.mDownloadRecords));
        }
    }
}
