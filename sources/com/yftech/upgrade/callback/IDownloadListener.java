package com.yftech.upgrade.callback;

import com.yftech.upgrade.data.TaskState;
import java.io.IOException;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.Response;

/* loaded from: /home/user/work/dex/classes.dex */
public interface IDownloadListener extends Callback {
    default void onCheckFileMd5(int i, long j, long j2) {
    }

    default void onDownloadPositionChanged(TaskState taskState) {
    }

    default void onDownloadStateChanged(TaskState taskState) {
    }

    @Override // okhttp3.Callback
    default void onFailure(Call call, IOException iOException) {
    }

    default void onFileChanged(int i, long j, long j2) {
    }

    @Override // okhttp3.Callback
    default void onResponse(Call call, Response response) throws IOException {
    }
}
