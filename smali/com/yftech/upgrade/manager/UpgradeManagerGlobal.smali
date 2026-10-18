.class public Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;
.super Ljava/lang/Object;
.source "UpgradeManagerGlobal.java"


# static fields
.field private static mInstance:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mCallbackList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/callback/IUpgradeCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

.field private mUpgradeInfo:Lcom/yftech/upgrade/data/UpgradeInfo;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "UpgradeManagerGlobal"

    .line 25
    iput-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    .line 29
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    .line 214
    new-instance v0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;-><init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    .line 44
    new-instance v0, Lcom/yftech/upgrade/data/UpgradeInfo;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/UpgradeInfo;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeInfo:Lcom/yftech/upgrade/data/UpgradeInfo;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Ljava/lang/String;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeInfo:Lcom/yftech/upgrade/data/UpgradeInfo;

    return-object p0
.end method

.method static synthetic access$200(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/data/UpgradeInfo;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeInfoChanged(Lcom/yftech/upgrade/data/UpgradeInfo;)V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;II)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeProgressChanged(II)V

    return-void
.end method

.method static synthetic access$400(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->handlerMcuUpgrade(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->handlerOsUpgrade(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;II)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeStateChanged(II)V

    return-void
.end method

.method public static getInstance()Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;
    .locals 1

    .line 36
    sget-object v0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mInstance:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-direct {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mInstance:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    .line 39
    :cond_0
    sget-object v0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mInstance:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    return-object v0
.end method

.method private handlerMcuUpgrade(I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/4 v0, 0x7

    :cond_0
    return-void
.end method

.method private handlerOsUpgrade(I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 v0, 0x5

    :cond_0
    return-void
.end method

.method private initUpgradePath()V
    .locals 5

    .line 64
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/yftech/upgrade/data/Config;->UPGRADE_DIR:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 65
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initUpgradePath, getPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ",exists:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ",getFreeSpace:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/io/File;->getFreeSpace()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ",canRead:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 65
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 72
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 75
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    .line 77
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    const-string v1, "initUpgradePath: files is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const/4 v1, 0x0

    .line 81
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_2

    .line 82
    iget-object v2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initUpgradePath file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private notifyUpgradeInfoChanged(Lcom/yftech/upgrade/data/UpgradeInfo;)V
    .locals 5

    .line 164
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    monitor-enter v0

    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IUpgradeCallback;

    .line 166
    iget-object v3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;

    invoke-direct {v4, p0, v2, p1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;-><init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;Lcom/yftech/upgrade/data/UpgradeInfo;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 173
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

.method private notifyUpgradeProgressChanged(II)V
    .locals 5

    .line 203
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    monitor-enter v0

    .line 204
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IUpgradeCallback;

    .line 205
    iget-object v3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;

    invoke-direct {v4, p0, v2, p1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;-><init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;II)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 212
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

.method private notifyUpgradeStateChanged(II)V
    .locals 5

    .line 191
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    monitor-enter v0

    .line 192
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IUpgradeCallback;

    .line 193
    iget-object v3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$3;

    invoke-direct {v4, p0, v2, p1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$3;-><init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;II)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 200
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

.method private notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 5

    .line 179
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    monitor-enter v0

    .line 180
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IUpgradeCallback;

    .line 181
    iget-object v3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;

    invoke-direct {v4, p0, v2, p1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;-><init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;Lcom/yftech/upgrade/data/TaskState;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

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


# virtual methods
.method public addCallback(Lcom/yftech/upgrade/callback/IUpgradeCallback;)V
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    monitor-enter v0

    .line 149
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 150
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
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

.method public init(Landroid/content/Context;)V
    .locals 2

    .line 56
    iput-object p1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mContext:Landroid/content/Context;

    .line 57
    invoke-direct {p0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->initUpgradePath()V

    .line 58
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->registerCarMCUUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;Landroid/os/Handler;)V

    .line 59
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->registerCarOSUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;Landroid/os/Handler;)V

    return-void
.end method

.method public release()V
    .locals 2

    .line 49
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->unregisterCarMCUUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;)V

    .line 50
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mUpgradeCallback:Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;

    invoke-virtual {v0, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->unregisterCarOSUpgradeCallback(Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;)V

    .line 51
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public removeCallback(Lcom/yftech/upgrade/callback/IUpgradeCallback;)V
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    monitor-enter v0

    .line 158
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mCallbackList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 159
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setUpgradeModule()V
    .locals 9

    .line 88
    new-instance v0, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    .line 96
    invoke-static {}, Lcom/yftech/upgrade/utils/FileUtils;->isMcuFileExist()Z

    move-result v1

    const-string v2, ""

    if-eqz v1, :cond_0

    .line 97
    sget-object v1, Lcom/yftech/upgrade/data/Config;->UPGRADE_DIR:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v1, v2

    .line 99
    :goto_0
    invoke-static {}, Lcom/yftech/upgrade/utils/FileUtils;->isOsFileExist()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 100
    sget-object v2, Lcom/yftech/upgrade/data/Config;->UPGRADE_DIR:Ljava/lang/String;

    .line 103
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 104
    invoke-virtual {v0, v4}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 105
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mContext:Landroid/content/Context;

    const v2, 0x7f0e0056

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 106
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void

    .line 110
    :cond_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v5, -0x1

    if-nez v3, :cond_3

    .line 111
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->addMCUUpgradeModule(Ljava/lang/String;)I

    move-result v3

    goto :goto_1

    :cond_3
    move v3, v5

    .line 114
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 115
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v5

    invoke-virtual {v5, v2}, Lcom/yftech/car/upgrade/CarUpgradeManager;->addOSUpgradeModule(Ljava/lang/String;)I

    move-result v5

    .line 118
    :cond_4
    iget-object v6, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "startUpgrade, mcuCode: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ",osCode:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ",mcuPath:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",osPath:"

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eq v4, v3, :cond_5

    if-eq v4, v5, :cond_5

    .line 120
    invoke-virtual {v0, v4}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 121
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->mContext:Landroid/content/Context;

    const v2, 0x7f0e0053

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 122
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_2

    :cond_5
    const/4 v1, 0x3

    .line 124
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 125
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    .line 127
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->startUpgrade()Z

    :goto_2
    return-void
.end method

.method public startUpgrade()Z
    .locals 5

    .line 133
    new-instance v0, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    .line 135
    invoke-static {}, Lcom/yftech/car/upgrade/CarUpgradeManager;->getInstance()Lcom/yftech/car/upgrade/CarUpgradeManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yftech/car/upgrade/CarUpgradeManager;->startUpgrade()Z

    move-result v1

    .line 136
    iget-object v2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startUpgrade, result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v1, :cond_0

    const/4 v2, 0x1

    .line 139
    invoke-virtual {v0, v2}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 140
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    :cond_0
    return v1
.end method
