package com.yftech.upgrade.data;

/* loaded from: /home/user/work/dex/classes.dex */
public class UpgradeInfo {
    private int mModule = -1;
    private int mStatus = -1;
    private int mProgress = 0;

    public int getModule() {
        return this.mModule;
    }

    public void setModule(int i) {
        this.mModule = i;
    }

    public int getStatus() {
        return this.mStatus;
    }

    public void setStatus(int i) {
        this.mStatus = i;
    }

    public int getProgress() {
        return this.mProgress;
    }

    public void setProgress(int i) {
        this.mProgress = i;
    }

    public void reset() {
        this.mModule = -1;
        this.mStatus = -1;
        this.mProgress = 0;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("module:" + getModule());
        stringBuffer.append(",status:" + getStatus());
        stringBuffer.append(",progress:" + getProgress());
        return stringBuffer.toString();
    }
}
