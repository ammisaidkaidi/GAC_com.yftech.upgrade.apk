package com.yftech.upgrade.utils;

import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import android.os.SystemClock;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.util.Log;
import com.yftech.upgrade.callback.IDownloadListener;
import com.yftech.upgrade.data.Config;
import com.yftech.upgrade.data.TaskState;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import okhttp3.ResponseBody;

/* loaded from: /home/user/work/dex/classes.dex */
public class FileUtils {
    private static final String TAG = "FileUtils";

    public static String getFileName(int i, boolean z) {
        if (i == 1) {
            StringBuilder sb = new StringBuilder();
            sb.append(Config.UPGRADE_DIR);
            sb.append(z ? Config.FILE_NAME_OS_MD5 : Config.FILE_NAME_OS);
            return sb.toString();
        }
        if (i != 2) {
            return "";
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(Config.UPGRADE_DIR);
        sb2.append(z ? Config.FILE_NAME_MCU_MD5 : Config.FILE_NAME_MCU);
        return sb2.toString();
    }

    public static boolean isUpgradeFileExist(String str) {
        return new File(str).exists();
    }

    public static boolean isMcuFileExist() {
        return isUpgradeFileExist(Config.UPGRADE_DIR + Config.FILE_NAME_MCU);
    }

    public static boolean isOsFileExist() {
        return isUpgradeFileExist(Config.UPGRADE_DIR + Config.FILE_NAME_OS);
    }

    public static boolean downloadFile(String str, int i, ResponseBody responseBody, IDownloadListener iDownloadListener, TaskState taskState) {
        InputStream byteStream;
        int i2;
        long j;
        int i3;
        boolean z = false;
        try {
            long contentLength = responseBody.contentLength();
            Log.d(TAG, "downloadFile, downloadFileLength:" + contentLength + "," + str);
            byteStream = responseBody.byteStream();
            FileOutputStream fileOutputStream = new FileOutputStream(str, true);
            try {
                j = new File(str).length();
                i2 = i;
            } catch (Exception e) {
                e.printStackTrace();
                i2 = i;
                j = 0;
            }
            byte[] bArr = new byte[i2];
            long j2 = contentLength + j;
            float f = ((float) j2) / 100.0f;
            iDownloadListener.onFileChanged(3, j, j2);
            long j3 = j;
            long j4 = 0;
            while (true) {
                int read = byteStream.read(bArr);
                if (read == -1) {
                    break;
                }
                long j5 = read;
                long j6 = j3 + j5;
                j4 += j5;
                if (((float) j4) >= f) {
                    i3 = read;
                    iDownloadListener.onFileChanged(3, j6, j2);
                    j4 = 0;
                } else {
                    i3 = read;
                }
                fileOutputStream.write(bArr, 0, i3);
                j3 = j6;
            }
            iDownloadListener.onFileChanged(3, j3, j2);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (Exception e2) {
            e = e2;
            e.printStackTrace();
            taskState.setErrorCode(2);
            taskState.setMessage(e.toString());
            taskState.setState(1);
            return z;
        }
        try {
            try {
                byteStream.close();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
            taskState.setState(2);
            return true;
        } catch (Exception e4) {
            e = e4;
            z = true;
            e.printStackTrace();
            taskState.setErrorCode(2);
            taskState.setMessage(e.toString());
            taskState.setState(1);
            return z;
        }
    }

    public static boolean isAvailableSize(Context context, String str, long j) {
        try {
            StatFs statFs = new StatFs(str);
            long availableBlocks = statFs.getAvailableBlocks() * statFs.getBlockSize();
            Log.d(TAG, "availableSize:" + formatFileSize(context, availableBlocks) + ", targetSize:" + formatFileSize(context, j));
            return availableBlocks > j;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String formatFileSize(Context context, long j) {
        return Formatter.formatFileSize(context, j);
    }

    public static long getFilePoint(String str) {
        try {
            File file = new File(str);
            if (file.exists()) {
                return file.length();
            }
            return 0L;
        } catch (Exception e) {
            e.printStackTrace();
            return 0L;
        }
    }

    public static void deleteFile(String str, boolean z) {
        File file = new File(str);
        if (file.isDirectory()) {
            File[] listFiles = file.listFiles();
            if (listFiles == null) {
                return;
            }
            for (File file2 : listFiles) {
                deleteFile(file2.getAbsolutePath(), true);
            }
            if (z) {
                try {
                    file.delete();
                    return;
                } catch (Exception e) {
                    e.printStackTrace();
                    return;
                }
            }
            return;
        }
        if (file.exists()) {
            try {
                file.delete();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public static void copyToFile(String str, int i, String str2, IDownloadListener iDownloadListener) {
        try {
            long currentTimeMillis = System.currentTimeMillis();
            byte[] bArr = new byte[i];
            File file = new File(str);
            if (!file.exists()) {
                return;
            }
            long length = file.length();
            File file2 = new File(str2);
            File parentFile = file2.getParentFile();
            if (!parentFile.exists()) {
                parentFile.mkdirs();
            }
            if (file2.exists()) {
                file2.delete();
            }
            file2.createNewFile();
            FileInputStream fileInputStream = new FileInputStream(file);
            FileOutputStream fileOutputStream = new FileOutputStream(file2);
            long j = 0;
            while (true) {
                int read = fileInputStream.read(bArr);
                if (read != -1) {
                    fileOutputStream.write(bArr, 0, read);
                    long j2 = j + read;
                    iDownloadListener.onFileChanged(3, j2, length);
                    j = j2;
                } else {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    fileInputStream.close();
                    iDownloadListener.onFileChanged(2, 0L, 0L);
                    System.out.println("copy time:" + (System.currentTimeMillis() - currentTimeMillis));
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            iDownloadListener.onFileChanged(1, 0L, 0L);
        }
    }

    public static boolean isExistFile(String str) {
        try {
            return new File(str).exists();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void deleteSdcardBigFiles() {
        String str;
        System.out.println("deleteSdcardBigFiles");
        long elapsedRealtime = SystemClock.elapsedRealtime();
        try {
            str = Environment.getExternalStorageDirectory().getPath();
        } catch (Exception e) {
            e.printStackTrace();
            str = "";
        }
        if (TextUtils.isEmpty(str)) {
            System.out.println("get sdcardPath is null");
            return;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(str + "/iflytek/res/Active/MVWRes/log/Vw");
        arrayList.add(str + "/iflytek/res/Active/SRRes/ResMandarin/log/Vad");
        arrayList.add(str + "/mtklog");
        arrayList.add(str + "/yflog");
        for (int i = 0; i < arrayList.size(); i++) {
            try {
                deleteFile(new File((String) arrayList.get(i)).getAbsolutePath(), true);
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        long elapsedRealtime2 = SystemClock.elapsedRealtime();
        System.out.println("deleteSdcardBigFiles, lost time:" + (elapsedRealtime2 - elapsedRealtime));
    }

    public static boolean checkFileMD5(File file, String str, IDownloadListener iDownloadListener) {
        long length;
        long j;
        try {
            length = file.length();
            j = 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!file.exists()) {
            Log.e(TAG, "checkFileMD5, fileName is not exist");
            return false;
        }
        if (TextUtils.isEmpty(str)) {
            Log.e(TAG, "checkFileMD5, md5String is null");
            return false;
        }
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        FileInputStream fileInputStream = new FileInputStream(file);
        byte[] bArr = new byte[Config.FILE_BUFFER_SIZE];
        while (true) {
            int read = fileInputStream.read(bArr);
            if (read == -1) {
                break;
            }
            messageDigest.update(bArr, 0, read);
            long j2 = j + read;
            iDownloadListener.onCheckFileMd5(3, j2, length);
            j = j2;
        }
        String hexString = Utils.toHexString(messageDigest.digest());
        Log.i(TAG, "calMd5 :" + hexString);
        Log.i(TAG, "md5String :" + str);
        iDownloadListener.onCheckFileMd5(str.equals(hexString) ? 2 : 1, 0L, 0L);
        try {
            fileInputStream.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return false;
    }

    public static boolean writeFile(String str, int i, String str2) {
        try {
            Log.i(TAG, "writeFile: " + str2);
            FileOutputStream fileOutputStream = new FileOutputStream(str, true);
            try {
                new File(str).deleteOnExit();
            } catch (Exception e) {
                e.printStackTrace();
            }
            byte[] bytes = str2.getBytes();
            fileOutputStream.write(bytes, 0, bytes.length);
            fileOutputStream.flush();
            fileOutputStream.close();
            return true;
        } catch (IOException e2) {
            e2.printStackTrace();
            return false;
        }
    }
}
