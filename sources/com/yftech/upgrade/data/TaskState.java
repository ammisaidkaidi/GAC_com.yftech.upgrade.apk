package com.yftech.upgrade.data;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: /home/user/work/dex/classes.dex */
public class TaskState {
    private Object mExtraData;
    private int mType = -1;
    private int mState = 0;
    private int mErrorCode = 0;
    private int mModule = -1;
    private String mMessage = "";
    private long mPosition = 0;
    private long mDuration = 100;
    private int mUpdateStatus = -1;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: /home/user/work/dex/classes.dex */
    public @interface ENUM_DEVICE_ID {
        public static final int MCU = 2;
        public static final int OS = 1;
        public static final int UNKNOWN = -1;
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: /home/user/work/dex/classes.dex */
    public @interface ENUM_ERROR {
        public static final int INTERNET = 2;
        public static final int NO_SPACE = 1;
        public static final int SERVER = 3;
        public static final int UNKNOWN = 0;
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: /home/user/work/dex/classes.dex */
    public @interface ENUM_MODULE {
        public static final int MCU = 2;
        public static final int OS = 1;
        public static final int UNKNOWN = -1;
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: /home/user/work/dex/classes.dex */
    public @interface ENUM_STATE {
        public static final int DOWNLOADING = 3;
        public static final int FAILED = 1;
        public static final int IDLE = 0;
        public static final int SUCCESS = 2;
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: /home/user/work/dex/classes.dex */
    public @interface ENUM_TYPE {
        public static final int DOWNLOAD = 2;
        public static final int IDLE = -1;
        public static final int REQUEST = 1;
        public static final int UPGRADE = 3;
    }

    public static String getModuleName(int i) {
        return i != 1 ? i != 2 ? "other" : "MCU" : "OS";
    }

    public int getState() {
        return this.mState;
    }

    public void setState(int i) {
        this.mState = i;
    }

    public String getMessage() {
        return this.mMessage;
    }

    public void setMessage(String str) {
        this.mMessage = str;
    }

    public int getType() {
        return this.mType;
    }

    public void setType(int i) {
        this.mType = i;
        setState(0);
        setMessage("");
    }

    public long getPosition() {
        return this.mPosition;
    }

    public void setPosition(long j) {
        this.mPosition = j;
    }

    public long getDuration() {
        return this.mDuration;
    }

    public void setDuration(long j) {
        if (0 != j) {
            this.mDuration = j;
        }
    }

    public int getErrorCode() {
        return this.mErrorCode;
    }

    public void setErrorCode(int i) {
        this.mErrorCode = i;
    }

    public int getModule() {
        return this.mModule;
    }

    public void setModule(int i) {
        this.mModule = i;
    }

    public int getUpdateStatus() {
        return this.mUpdateStatus;
    }

    public void setUpdateStatus(int i) {
        this.mUpdateStatus = i;
    }

    public String getTypeString() {
        int i = this.mType;
        return 1 == i ? "TYPE_REQUEST" : 2 == i ? "TYPE_DOWNLOAD" : "";
    }

    public Object getExtraData() {
        return this.mExtraData;
    }

    public void setExtraData(Object obj) {
        this.mExtraData = obj;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(getClass().getSimpleName());
        stringBuffer.append(",type:" + this.mType);
        stringBuffer.append(",state:" + this.mState);
        stringBuffer.append(",message:" + this.mMessage);
        stringBuffer.append(",position:" + this.mPosition);
        stringBuffer.append(",duration:" + this.mDuration);
        stringBuffer.append(",module:" + this.mModule);
        stringBuffer.append(",error:" + this.mErrorCode);
        return stringBuffer.toString();
    }
}
