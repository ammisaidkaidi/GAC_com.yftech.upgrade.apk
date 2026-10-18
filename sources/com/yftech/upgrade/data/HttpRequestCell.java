package com.yftech.upgrade.data;

import android.text.TextUtils;
import android.util.Log;
import com.yftech.upgrade.manager.VersionManagerGlobal;
import java.util.ArrayList;
import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public class HttpRequestCell {
    private String TAG = "HttpRequestCell";
    public String vehicleId = "vehicleId";
    private String projectName = "";
    public List<Version> oldVersionList = new ArrayList();

    /* loaded from: /home/user/work/dex/classes.dex */
    public class Version {
        public int deviceId;
        public String version;

        public Version(int i, String str) {
            this.deviceId = 0;
            this.version = "";
            this.deviceId = i;
            this.version = str;
        }
    }

    public void updateVersion() {
        this.oldVersionList.clear();
        ProjectInfo projectInfo = ProjectManager.getInstance().getProjectInfo();
        String mcuVersion = VersionManagerGlobal.getMcuVersion();
        String systemVersion = VersionManagerGlobal.getSystemVersion();
        this.projectName = Config.getBrand();
        String brandExt = Config.getBrandExt();
        if (!TextUtils.isEmpty(brandExt)) {
            this.projectName += "-" + brandExt;
        }
        if (projectInfo != null) {
            if (!TextUtils.isEmpty(mcuVersion)) {
                this.oldVersionList.add(new Version(projectInfo.getMcuDeviceId(), mcuVersion));
            }
            if (TextUtils.isEmpty(systemVersion)) {
                return;
            }
            this.oldVersionList.add(new Version(projectInfo.getOSDeviceId(), systemVersion));
            return;
        }
        Log.w(this.TAG, "updateVersion: project not found");
    }
}
