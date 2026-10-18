package com.yftech.upgrade.data;

import android.os.Build;
import java.util.ArrayList;
import java.util.HashMap;

/* loaded from: /home/user/work/dex/classes.dex */
public class ProjectManager {
    public static final String CB_A60_ZD_A = "A60_ZD_A";
    public static final String CB_A60_ZD_B = "A60_ZD_B";
    public static final String CB_A88_ZD_A = "A88_ZD_A";
    public static final String CB_A88_ZD_B = "A88_ZD_B";
    public static final String CB_IHU12_C1 = "A79_G";
    public static final String HU23 = "A29";
    public static ProjectManager mInstance;
    private static ArrayList<String> ABROAD_PROJECTS = new ArrayList<>();
    private static HashMap<String, ProjectInfo> mProjectMap = new HashMap() { // from class: com.yftech.upgrade.data.ProjectManager.1
    };

    public static ProjectManager getInstance() {
        if (mInstance == null) {
            mInstance = new ProjectManager();
        }
        return mInstance;
    }

    private ProjectManager() {
        init();
    }

    private void init() {
        ABROAD_PROJECTS.add(CB_A60_ZD_A);
        ABROAD_PROJECTS.add(CB_A60_ZD_B);
        ABROAD_PROJECTS.add(CB_A88_ZD_B);
        ABROAD_PROJECTS.add(CB_A88_ZD_A);
        mProjectMap.put(Build.BRAND.toUpperCase(), new ProjectInfo(Build.BRAND, 1, 2));
        mProjectMap.put(HU23, new ProjectInfo(HU23, 1, 2));
        mProjectMap.put(CB_IHU12_C1, new ProjectInfo(CB_IHU12_C1, 1, 2));
    }

    public ProjectInfo getProjectInfo() {
        ProjectInfo projectInfo = mProjectMap.get(Build.BRAND.toUpperCase());
        return projectInfo == null ? new ProjectInfo(Build.BRAND, 1, 2) : projectInfo;
    }

    public static boolean isAbroadProject() {
        return ABROAD_PROJECTS.contains(Config.getBrand());
    }
}
