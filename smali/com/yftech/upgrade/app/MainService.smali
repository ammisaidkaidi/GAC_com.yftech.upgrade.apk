.class public Lcom/yftech/upgrade/app/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# static fields
.field public static final COMMAND_HIDE:Ljava/lang/String; = "hide"

.field public static final COMMAND_REQUEST_DOWNLOAD:Ljava/lang/String; = "request_download"

.field public static final COMMAND_REQUEST_UPGRADE:Ljava/lang/String; = "request_upgrade"

.field public static final COMMAND_REQUEST_VERSION:Ljava/lang/String; = "request_version"

.field public static final COMMAND_SHOW:Ljava/lang/String; = "show"

.field public static final KE_COMMAND:Ljava/lang/String; = "command"


# instance fields
.field private TAG:Ljava/lang/String;

.field private mDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

.field private mLock:Ljava/lang/Object;

.field private mUpgradeCallback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

.field private mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const-string v0, "MainService"

    .line 43
    iput-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainService;->mLock:Ljava/lang/Object;

    .line 287
    new-instance v0, Lcom/yftech/upgrade/app/MainService$1;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/app/MainService$1;-><init>(Lcom/yftech/upgrade/app/MainService;)V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainService;->mDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    .line 373
    new-instance v0, Lcom/yftech/upgrade/app/MainService$3;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/app/MainService$3;-><init>(Lcom/yftech/upgrade/app/MainService;)V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeCallback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/app/MainService;)Ljava/lang/String;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/app/MainService;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/app/MainService;->updateRequestState(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/upgrade/app/MainService;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/app/MainService;->updateDownloadState(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/upgrade/app/MainService;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyDownloadStateChanged()V

    return-void
.end method

.method static synthetic access$400(Lcom/yftech/upgrade/app/MainService;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyUpgradeStateChanged()V

    return-void
.end method

.method private checkContinueDownload()V
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v1, "checkContinueDownload: "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->hasDownloadRecord()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->isDownloadFinish()Z

    move-result v0

    if-nez v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v1, "checkContinueDownload: requestDownload"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->requestDownload()V

    :cond_0
    return-void
.end method

.method private notifyDownloadStateChanged()V
    .locals 2

    .line 279
    invoke-static {}, Lcom/yftech/upgrade/app/MainApplication;->getMainApplication()Lcom/yftech/upgrade/app/MainApplication;

    move-result-object v0

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/app/MainApplication;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method private notifyUpgradeStateChanged()V
    .locals 2

    .line 283
    invoke-static {}, Lcom/yftech/upgrade/app/MainApplication;->getMainApplication()Lcom/yftech/upgrade/app/MainApplication;

    move-result-object v0

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/app/MainApplication;->notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method private parseCommand(Landroid/content/Intent;)V
    .locals 3

    if-nez p1, :cond_0

    .line 113
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v0, "parseCommand: intent is null"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v0, "command"

    .line 116
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 117
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parseCommand: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "request_version"

    .line 119
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 120
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->show(Landroid/content/Context;)V

    .line 121
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->requestVersion()V

    goto :goto_0

    :cond_1
    const-string v0, "request_download"

    .line 122
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 123
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->show(Landroid/content/Context;)V

    .line 124
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->requestDownload()V

    goto :goto_0

    :cond_2
    const-string v0, "request_upgrade"

    .line 125
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 126
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->show(Landroid/content/Context;)V

    .line 127
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->startUpgrade()V

    goto :goto_0

    :cond_3
    const-string v0, "show"

    .line 128
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 129
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->show(Landroid/content/Context;)V

    goto :goto_0

    :cond_4
    const-string v0, "hide"

    .line 130
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 131
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->remove(Landroid/content/Context;)V

    :cond_5
    :goto_0
    return-void
.end method

.method private updateDownloadState(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 3

    .line 346
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    .line 347
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getDuration()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 348
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 349
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 350
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 351
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getErrorCode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 353
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    goto :goto_0

    .line 355
    :cond_0
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result p1

    const/4 v0, 0x2

    if-ne v0, p1, :cond_3

    .line 356
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/yftech/upgrade/data/DataProvider;->popDownloadTask(Z)Lcom/yftech/upgrade/data/DownloadRecord;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 359
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    .line 360
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/DataProvider;->updateDownloadRecord(Lcom/yftech/upgrade/data/DownloadRecord;)V

    .line 363
    :cond_1
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/data/DataProvider;->popDownloadTask(Z)Lcom/yftech/upgrade/data/DownloadRecord;

    move-result-object p1

    if-nez p1, :cond_2

    .line 364
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateDownloadState: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/upgrade/data/DataProvider;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 368
    :cond_2
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->requestDownload()V

    :cond_3
    :goto_0
    return-void
.end method

.method private updateRequestState(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 2

    .line 317
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    .line 318
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 319
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 320
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getErrorCode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 322
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result p1

    const/4 v1, 0x2

    if-ne v1, p1, :cond_1

    .line 323
    new-instance p1, Lcom/yftech/upgrade/app/MainService$2;

    invoke-direct {p1, p0}, Lcom/yftech/upgrade/app/MainService$2;-><init>(Lcom/yftech/upgrade/app/MainService;)V

    .line 324
    invoke-virtual {p1}, Lcom/yftech/upgrade/app/MainService$2;->getType()Ljava/lang/reflect/Type;

    move-result-object p1

    .line 326
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/yftech/upgrade/utils/JsonHelper;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yftech/upgrade/data/HttpRespondCell;

    .line 327
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/DataProvider;->setVersionRespond(Lcom/yftech/upgrade/data/HttpRespondCell;)V

    .line 330
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DataProvider;->getDownloadRecords()Ljava/util/ArrayList;

    move-result-object p1

    .line 331
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 335
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 336
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/upgrade/data/DownloadRecord;

    .line 337
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1

    .line 81
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v0, "dump: "

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "#### UpgradeService ####"

    .line 82
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 85
    array-length p1, p3

    if-lez p1, :cond_0

    const/4 p1, 0x0

    .line 86
    aget-object p1, p3, p1

    .line 89
    :cond_0
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 91
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p3

    invoke-virtual {p3}, Lcom/yftech/upgrade/data/DataProvider;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p3, "\n\n###########################\n"

    .line 93
    invoke-virtual {p1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    return-object p0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    .line 57
    new-instance p1, Landroid/os/Binder;

    invoke-direct {p1}, Landroid/os/Binder;-><init>()V

    return-object p1
.end method

.method public onCreate()V
    .locals 3

    .line 62
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 64
    new-instance v0, Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    .line 66
    invoke-static {}, Lcom/yftech/upgrade/manager/DownloadManager;->getInstance()Lcom/yftech/upgrade/manager/DownloadManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/app/MainService;->mDownloadCallback:Lcom/yftech/upgrade/callback/IDownloadListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/yftech/upgrade/manager/DownloadManager;->registerListen(Lcom/yftech/upgrade/callback/IDownloadListener;Landroid/os/Handler;)V

    .line 68
    invoke-static {}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeCallback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->addCallback(Lcom/yftech/upgrade/callback/IUpgradeCallback;)V

    .line 72
    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    const-string v1, "upgrade_ota"

    invoke-static {v1, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 75
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->checkContinueDownload()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 101
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/app/MainService;->parseCommand(Landroid/content/Intent;)V

    .line 102
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p1

    return p1
.end method

.method public requestDownload()V
    .locals 7

    .line 214
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->isTaskBusying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestDownload, busy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 219
    :cond_0
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    const/4 v1, 0x2

    .line 220
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    .line 222
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->isLatestVersion()Z

    move-result v2

    const-wide/16 v3, 0x64

    if-eqz v2, :cond_1

    .line 223
    iget-object v2, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v5, "requestDownload: isLatestVersion"

    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 225
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e003e

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 226
    invoke-virtual {v0, v3, v4}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 227
    invoke-virtual {v0, v3, v4}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 228
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyDownloadStateChanged()V

    return-void

    .line 231
    :cond_1
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->hasDownloadRecord()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->isDownloadFinish()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 232
    iget-object v2, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v5, "requestDownload: isDownloadFinish"

    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 234
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0033

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 235
    invoke-virtual {v0, v3, v4}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 236
    invoke-virtual {v0, v3, v4}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 237
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyDownloadStateChanged()V

    return-void

    .line 240
    :cond_2
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->hasDownloadRecord()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->isRequestVersion()Z

    move-result v2

    if-nez v2, :cond_3

    .line 241
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v2, "requestDownload: isRequestVersion false"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    .line 242
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 243
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0041

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 244
    invoke-virtual {v0, v3, v4}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 245
    invoke-virtual {v0, v3, v4}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 246
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyDownloadStateChanged()V

    return-void

    .line 251
    :cond_3
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/yftech/upgrade/data/DataProvider;->popDownloadTask(Z)Lcom/yftech/upgrade/data/DownloadRecord;

    move-result-object v2

    .line 252
    iget-object v4, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "requestDownload, record: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v2, :cond_4

    .line 255
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0e0035

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 256
    invoke-virtual {v0, v2}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 258
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyDownloadStateChanged()V

    return-void

    .line 269
    :cond_4
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setModule(I)V

    const/4 v1, 0x3

    .line 270
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 271
    invoke-virtual {v0, v3}, Lcom/yftech/upgrade/data/TaskState;->setErrorCode(I)V

    .line 273
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getTypeString()Ljava/lang/String;

    move-result-object v0

    .line 274
    invoke-static {}, Lcom/yftech/upgrade/manager/DownloadManager;->getInstance()Lcom/yftech/upgrade/manager/DownloadManager;

    move-result-object v1

    invoke-virtual {v1, v2, v0}, Lcom/yftech/upgrade/manager/DownloadManager;->requestDownload(Lcom/yftech/upgrade/data/DownloadRecord;Ljava/lang/String;)V

    return-void
.end method

.method public requestVersion()V
    .locals 3

    .line 181
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->isTaskBusying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestVersion, busy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 186
    :cond_0
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    const/4 v1, 0x1

    .line 187
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    .line 189
    new-instance v1, Lcom/yftech/upgrade/data/HttpRequestCell;

    invoke-direct {v1}, Lcom/yftech/upgrade/data/HttpRequestCell;-><init>()V

    .line 190
    invoke-virtual {v1}, Lcom/yftech/upgrade/data/HttpRequestCell;->updateVersion()V

    const/4 v2, 0x3

    .line 192
    invoke-virtual {v0, v2}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 193
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->resetRespond()V

    .line 195
    invoke-static {}, Lcom/yftech/upgrade/manager/DownloadManager;->getInstance()Lcom/yftech/upgrade/manager/DownloadManager;

    move-result-object v2

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getTypeString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Lcom/yftech/upgrade/manager/DownloadManager;->requestVersion(Lcom/yftech/upgrade/data/HttpRequestCell;Ljava/lang/String;)V

    return-void
.end method

.method public startUpgrade()V
    .locals 4

    .line 140
    invoke-static {}, Lcom/yftech/upgrade/manager/CarStateManager;->getInstance()Lcom/yftech/upgrade/manager/CarStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/CarStateManager;->isParking()Z

    move-result v0

    if-nez v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->mUpgradeViewManager:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateParking()V

    return-void

    .line 144
    :cond_0
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->isTaskBusying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 145
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startUpgrade, busy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 149
    :cond_1
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    const/4 v1, 0x3

    .line 150
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    .line 152
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->isDownloadFinish()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_2

    .line 153
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v2, "startUpgrade: isDownloadFinish false"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-virtual {v0, v3}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 155
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0036

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 156
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyUpgradeStateChanged()V

    return-void

    .line 158
    :cond_2
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->isLatestVersion()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 159
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v2, "startUpgrade: isLatestVersion"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x2

    .line 160
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 161
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e003e

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 162
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyUpgradeStateChanged()V

    return-void

    .line 164
    :cond_3
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->isRequestVersion()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DataProvider;->hasDownloadRecord()Z

    move-result v2

    if-nez v2, :cond_4

    .line 165
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainService;->TAG:Ljava/lang/String;

    const-string v2, "startUpgrade: isRequestVersion false"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    invoke-virtual {v0, v3}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 167
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/MainService;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0041

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 168
    invoke-direct {p0}, Lcom/yftech/upgrade/app/MainService;->notifyUpgradeStateChanged()V

    return-void

    .line 172
    :cond_4
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 173
    invoke-static {}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->setUpgradeModule()V

    return-void
.end method
