.class public interface abstract Lcom/yftech/upgrade/callback/IDownloadListener;
.super Ljava/lang/Object;
.source "IDownloadListener.java"

# interfaces
.implements Lokhttp3/Callback;


# virtual methods
.method public onCheckFileMd5(IJJ)V
    .locals 0

    return-void
.end method

.method public onDownloadPositionChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    return-void
.end method

.method public onDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    return-void
.end method

.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 0

    return-void
.end method

.method public onFileChanged(IJJ)V
    .locals 0

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method
