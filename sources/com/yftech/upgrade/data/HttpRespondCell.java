package com.yftech.upgrade.data;

import com.yftech.upgrade.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public class HttpRespondCell {
    public String msg = "";
    public String code = "";
    public Info data = new Info();

    /* loaded from: /home/user/work/dex/classes.dex */
    public class Info {
        public String vehicleId = "";
        public List<Item> list = new ArrayList();

        public Info() {
        }

        public String toString() {
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append("\n");
            stringBuffer.append("vehicleId:" + this.vehicleId + "\n");
            StringBuilder sb = new StringBuilder();
            sb.append(Utils.getListString(this.list));
            sb.append("\n");
            stringBuffer.append(sb.toString());
            return stringBuffer.toString();
        }
    }

    /* loaded from: /home/user/work/dex/classes.dex */
    public static class Item {
        public int createdAt = 0;
        public int deviceId = 0;
        public String md5 = "";
        public String newVer = "";
        public String notes = "";
        public String url = "";
        public long size = 0;

        public String toString() {
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append("\n");
            stringBuffer.append("createdAt:" + this.createdAt + "\n");
            stringBuffer.append("deviceId:" + this.deviceId + "\n");
            stringBuffer.append("md5:" + this.md5 + "\n");
            stringBuffer.append("newVer:" + this.newVer + "\n");
            stringBuffer.append("url:" + this.url + "\n");
            stringBuffer.append("notes:" + this.notes + "\n");
            stringBuffer.append("size:" + this.size + "\n");
            return stringBuffer.toString();
        }
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("\n");
        if (this.data != null) {
            stringBuffer.append("data:" + this.data.toString() + "\n");
        }
        return stringBuffer.toString();
    }
}
