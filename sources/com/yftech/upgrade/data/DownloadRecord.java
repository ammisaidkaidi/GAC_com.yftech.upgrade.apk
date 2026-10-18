package com.yftech.upgrade.data;

/* loaded from: /home/user/work/dex/classes.dex */
public class DownloadRecord {
    private int mDownloadCode = 0;
    private long mDownloadPoint = 0;
    private int deviceId = -1;
    private String url = "";
    private String md5 = "";
    private String newVer = "";
    private long size = 0;

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(getClass().getSimpleName());
        stringBuffer.append(",deviceId:" + this.deviceId);
        stringBuffer.append(",code:" + this.mDownloadCode);
        stringBuffer.append(",point:" + this.mDownloadPoint);
        stringBuffer.append(",md5:" + this.md5);
        stringBuffer.append(",newVer:" + this.newVer);
        stringBuffer.append(",url:" + this.url);
        stringBuffer.append(",size:" + this.size);
        return stringBuffer.toString();
    }

    public int getDownloadCode() {
        return this.mDownloadCode;
    }

    public void setDownloadCode(int i) {
        this.mDownloadCode = i;
    }

    public int getDeviceId() {
        return this.deviceId;
    }

    public void setDeviceId(int i) {
        this.deviceId = i;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String str) {
        this.url = str;
    }

    public String getMd5() {
        return this.md5;
    }

    public void setMd5(String str) {
        this.md5 = str;
    }

    public String getNewVer() {
        return this.newVer;
    }

    public void setNewVer(String str) {
        this.newVer = str;
    }

    public long getSize() {
        return this.size;
    }

    public void setSize(long j) {
        this.size = j;
    }

    public long getDownloadPoint() {
        return this.mDownloadPoint;
    }

    public void setDownloadPoint(long j) {
        this.mDownloadPoint = j;
    }

    public int getModule() {
        ProjectInfo projectInfo = ProjectManager.getInstance().getProjectInfo();
        if (projectInfo == null) {
            return -1;
        }
        if (projectInfo.getMcuDeviceId() == getDeviceId()) {
            return 2;
        }
        return projectInfo.getOSDeviceId() == getDeviceId() ? 1 : -1;
    }
}
