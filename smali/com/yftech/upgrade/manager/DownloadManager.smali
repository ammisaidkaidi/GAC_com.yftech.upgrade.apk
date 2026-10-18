.class public Lcom/yftech/upgrade/manager/DownloadManager;
.super Ljava/lang/Object;
.source "DownloadManager.java"


# static fields
.field public static final RESPOND_CODE_SUCCESS:I = 0xc8

.field private static mInstance:Lcom/yftech/upgrade/manager/DownloadManager;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mCallbackList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/callback/IDownloadListener;",
            ">;"
        }
    .end annotation
.end field

.field private mHttpCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

.field private mHttpDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

.field private mLock:Ljava/lang/Object;

.field private mRequestCalls:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lokhttp3/Call;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "DownloadManager"

    .line 39
    iput-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mCallbackList:Ljava/util/ArrayList;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mRequestCalls:Ljava/util/HashMap;

    .line 52
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    .line 217
    new-instance v0, Lcom/yftech/upgrade/manager/DownloadManager$1;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/DownloadManager$1;-><init>(Lcom/yftech/upgrade/manager/DownloadManager;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mHttpCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    .line 292
    new-instance v0, Lcom/yftech/upgrade/manager/DownloadManager$2;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/DownloadManager$2;-><init>(Lcom/yftech/upgrade/manager/DownloadManager;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mHttpDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/manager/DownloadManager;)Ljava/lang/String;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/manager/DownloadManager;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/upgrade/manager/DownloadManager;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadPositionChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/upgrade/manager/DownloadManager;Lokhttp3/Response;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/DownloadManager;->writeFiles(Lokhttp3/Response;)V

    return-void
.end method

.method public static getInstance()Lcom/yftech/upgrade/manager/DownloadManager;
    .locals 1

    .line 56
    sget-object v0, Lcom/yftech/upgrade/manager/DownloadManager;->mInstance:Lcom/yftech/upgrade/manager/DownloadManager;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-direct {v0}, Lcom/yftech/upgrade/manager/DownloadManager;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/manager/DownloadManager;->mInstance:Lcom/yftech/upgrade/manager/DownloadManager;

    .line 59
    :cond_0
    sget-object v0, Lcom/yftech/upgrade/manager/DownloadManager;->mInstance:Lcom/yftech/upgrade/manager/DownloadManager;

    return-object v0
.end method

.method private notifyDownloadPositionChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 3

    .line 192
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 193
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IDownloadListener;

    .line 194
    invoke-interface {v2, p1}, Lcom/yftech/upgrade/callback/IDownloadListener;->onDownloadPositionChanged(Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_0

    .line 213
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 3

    .line 167
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 168
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IDownloadListener;

    .line 169
    invoke-interface {v2, p1}, Lcom/yftech/upgrade/callback/IDownloadListener;->onDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_0

    .line 188
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private writeFiles(Lokhttp3/Response;)V
    .locals 14

    .line 364
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    .line 366
    new-instance v0, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    const/4 v1, 0x2

    .line 367
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    .line 368
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/yftech/upgrade/data/DataProvider;->popDownloadTask(Z)Lcom/yftech/upgrade/data/DownloadRecord;

    move-result-object v2

    const-wide/16 v4, 0x64

    const/4 v6, 0x1

    if-nez v2, :cond_0

    .line 370
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    const-string v1, "writeFiles record is null"

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    invoke-virtual {v0, v4, v5}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 372
    invoke-virtual {v0, v6}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 373
    invoke-virtual {v0, v3}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 374
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void

    .line 379
    :cond_0
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v7

    invoke-static {v7, v3}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    move-result-object v3

    .line 380
    invoke-virtual {p1}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v7

    .line 381
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadPoint()J

    move-result-wide v9

    .line 382
    iget-object v11, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "onResponse,fileLeftLength:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v13, ",filePath:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, ",downloadPoint:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v11, 0x0

    cmp-long v9, v11, v9

    if-nez v9, :cond_1

    .line 388
    invoke-virtual {p0, v3}, Lcom/yftech/upgrade/manager/DownloadManager;->deleteFiles(Ljava/lang/String;)V

    .line 391
    :cond_1
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v9

    invoke-static {v9, v6}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/yftech/upgrade/manager/DownloadManager;->deleteFiles(Ljava/lang/String;)V

    .line 393
    invoke-static {}, Lcom/yftech/upgrade/utils/FileUtils;->deleteSdcardBigFiles()V

    .line 395
    invoke-static {}, Lcom/yftech/upgrade/app/MainApplication;->getMainApplication()Lcom/yftech/upgrade/app/MainApplication;

    move-result-object v9

    sget-object v10, Lcom/yftech/upgrade/data/Config;->UPGRADE_DIR:Ljava/lang/String;

    invoke-static {v9, v10, v7, v8}, Lcom/yftech/upgrade/utils/FileUtils;->isAvailableSize(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 396
    iget-object v6, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    const-string v7, "writeFiles: downloadFile"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v6, 0x2000

    .line 397
    iget-object v7, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mHttpDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    invoke-static {v3, v6, p1, v7, v0}, Lcom/yftech/upgrade/utils/FileUtils;->downloadFile(Ljava/lang/String;ILokhttp3/ResponseBody;Lcom/yftech/upgrade/callback/IDownloadListener;Lcom/yftech/upgrade/data/TaskState;)Z

    .line 399
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result p1

    if-ne v1, p1, :cond_3

    .line 400
    invoke-virtual {p0, v2}, Lcom/yftech/upgrade/manager/DownloadManager;->createMd5File(Lcom/yftech/upgrade/data/DownloadRecord;)V

    .line 401
    invoke-virtual {v0, v4, v5}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    goto :goto_0

    .line 412
    :cond_2
    invoke-virtual {v0, v6}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 413
    invoke-virtual {v0, v6}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 416
    :cond_3
    :goto_0
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method


# virtual methods
.method public cancelCalls()V
    .locals 4

    .line 439
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 440
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mRequestCalls:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 441
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 442
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 443
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lokhttp3/Call;

    invoke-interface {v3}, Lokhttp3/Call;->cancel()V

    .line 444
    invoke-static {}, Lcom/yftech/upgrade/utils/OKHttp3Utils;->getInstance()Lcom/yftech/upgrade/utils/OKHttp3Utils;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/yftech/upgrade/utils/OKHttp3Utils;->cancelTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 446
    :cond_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mRequestCalls:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 447
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public createMd5File(Lcom/yftech/upgrade/data/DownloadRecord;)V
    .locals 4

    .line 421
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    move-result-object v0

    .line 422
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 423
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    const-string v0, "createMd5File: fileName is null"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 426
    :cond_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createMd5File: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getMd5()Ljava/lang/String;

    move-result-object p1

    const v1, 0xf000

    .line 428
    invoke-static {v0, v1, p1}, Lcom/yftech/upgrade/utils/FileUtils;->writeFile(Ljava/lang/String;ILjava/lang/String;)Z

    return-void
.end method

.method public deleteFiles(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 433
    invoke-static {p1, v0}, Lcom/yftech/upgrade/utils/FileUtils;->deleteFile(Ljava/lang/String;Z)V

    return-void
.end method

.method public registerListen(Lcom/yftech/upgrade/callback/IDownloadListener;Landroid/os/Handler;)V
    .locals 1

    .line 69
    iget-object p2, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter p2

    .line 70
    :try_start_0
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_0
    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public requestDownload(Lcom/yftech/upgrade/data/DownloadRecord;Ljava/lang/String;)V
    .locals 11

    .line 111
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 112
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/DownloadManager;->cancelCalls()V

    .line 114
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    move-result-object v1

    .line 115
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 117
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v1

    const-wide/16 v4, 0x0

    if-eqz v1, :cond_1

    .line 118
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v8

    cmp-long v1, v6, v8

    if-gtz v1, :cond_0

    .line 119
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    goto :goto_0

    .line 120
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->length()J

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    :cond_1
    move-wide v6, v4

    .line 126
    :goto_0
    new-instance v1, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v1}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    const/4 v3, 0x2

    .line 127
    invoke-virtual {v1, v3}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    const/4 v8, 0x3

    .line 128
    invoke-virtual {v1, v8}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 129
    invoke-virtual {v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    cmp-long v4, v6, v4

    if-lez v4, :cond_2

    .line 132
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v4

    cmp-long v4, v6, v4

    if-nez v4, :cond_2

    .line 133
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    const-string p2, "requestDownload: download already finish"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-virtual {v1, v6, v7}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 136
    invoke-virtual {v1, v6, v7}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 138
    invoke-virtual {v1, v3}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 139
    invoke-direct {p0, v1}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    .line 140
    monitor-exit v0

    return-void

    .line 144
    :cond_2
    invoke-virtual {p1, v6, v7}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadPoint(J)V

    .line 148
    iget-object v3, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestDownload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    invoke-virtual {v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 152
    invoke-direct {p0, v1}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    .line 154
    invoke-static {}, Lcom/yftech/upgrade/utils/OKHttp3Utils;->getInstance()Lcom/yftech/upgrade/utils/OKHttp3Utils;

    move-result-object v5

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getUrl()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mHttpDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadPoint()J

    move-result-wide v8

    move-object v10, p2

    invoke-virtual/range {v5 .. v10}, Lcom/yftech/upgrade/utils/OKHttp3Utils;->downAsynFile(Ljava/lang/String;Lokhttp3/Callback;JLjava/lang/String;)Lokhttp3/Call;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 157
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mRequestCalls:Ljava/util/HashMap;

    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 159
    :cond_3
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    const-string p2, "requestDownload: call is null"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public requestVersion(Lcom/yftech/upgrade/data/HttpRequestCell;Ljava/lang/String;)V
    .locals 4

    .line 85
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 86
    :try_start_0
    invoke-static {p1}, Lcom/yftech/upgrade/utils/JsonHelper;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 87
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestVersion, json: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/DownloadManager;->cancelCalls()V

    .line 91
    new-instance v1, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v1}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    const/4 v2, 0x1

    .line 92
    invoke-virtual {v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    const/4 v2, 0x3

    .line 93
    invoke-virtual {v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    const/4 v2, 0x0

    .line 94
    invoke-virtual {v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 95
    invoke-direct {p0, v1}, Lcom/yftech/upgrade/manager/DownloadManager;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    .line 97
    invoke-static {}, Lcom/yftech/upgrade/data/Config;->buildAddress()Ljava/lang/String;

    move-result-object v1

    .line 98
    invoke-static {}, Lcom/yftech/upgrade/utils/OKHttp3Utils;->getInstance()Lcom/yftech/upgrade/utils/OKHttp3Utils;

    move-result-object v2

    iget-object v3, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mHttpCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    invoke-virtual {v2, v1, v3, p1, p2}, Lcom/yftech/upgrade/utils/OKHttp3Utils;->postAsynHttp(Ljava/lang/String;Lokhttp3/Callback;Ljava/lang/String;Ljava/lang/Object;)Lokhttp3/Call;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 101
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mRequestCalls:Ljava/util/HashMap;

    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 103
    :cond_0
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->TAG:Ljava/lang/String;

    const-string p2, "requestVersion: call is null"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public unregisterListen(Lcom/yftech/upgrade/callback/IDownloadListener;)V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 79
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/DownloadManager;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 80
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
