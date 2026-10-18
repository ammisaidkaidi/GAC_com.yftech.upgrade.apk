package com.yftech.upgrade.data;

/* loaded from: /home/user/work/dex/classes.dex */
public class ProjectInfo {
    private int mMcuDeviceId;
    private int mOSDeviceId;
    private String name;

    public ProjectInfo(String str, int i, int i2) {
        this.name = "NONE";
        this.name = str;
        this.mOSDeviceId = i;
        this.mMcuDeviceId = i2;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public int getOSDeviceId() {
        return this.mOSDeviceId;
    }

    public void setOSDeviceId(int i) {
        this.mOSDeviceId = i;
    }

    public int getMcuDeviceId() {
        return this.mMcuDeviceId;
    }

    public void setMcuDeviceId(int i) {
        this.mMcuDeviceId = i;
    }

    public String toString() {
        return "ProjectInfo{name='" + this.name + "', mOSDeviceId=" + this.mOSDeviceId + ", mMcuDeviceId=" + this.mMcuDeviceId + '}';
    }
}
