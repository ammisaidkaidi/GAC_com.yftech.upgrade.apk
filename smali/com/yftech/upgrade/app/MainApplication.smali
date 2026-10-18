.class public Lcom/yftech/upgrade/app/MainApplication;
.super Landroid/app/Application;
.source "MainApplication.java"


# static fields
.field private static mMainApplication:Lcom/yftech/upgrade/app/MainApplication;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private mLock:Ljava/lang/Object;

.field private mUICallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/callback/IUICallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    const-string v0, "MainApplication"

    .line 22
    iput-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->TAG:Ljava/lang/String;

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mLock:Ljava/lang/Object;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mUICallbacks:Ljava/util/ArrayList;

    .line 27
    new-instance v0, Lcom/yftech/upgrade/app/MainApplication$1;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/app/MainApplication$1;-><init>(Lcom/yftech/upgrade/app/MainApplication;)V

    iput-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static getMainApplication()Lcom/yftech/upgrade/app/MainApplication;
    .locals 1

    .line 60
    sget-object v0, Lcom/yftech/upgrade/app/MainApplication;->mMainApplication:Lcom/yftech/upgrade/app/MainApplication;

    return-object v0
.end method


# virtual methods
.method public notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 5

    .line 92
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 93
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainApplication;->mUICallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IUICallback;

    .line 96
    iget-object v3, p0, Lcom/yftech/upgrade/app/MainApplication;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/yftech/upgrade/app/MainApplication$3;

    invoke-direct {v4, p0, v2, p1}, Lcom/yftech/upgrade/app/MainApplication$3;-><init>(Lcom/yftech/upgrade/app/MainApplication;Lcom/yftech/upgrade/callback/IUICallback;Lcom/yftech/upgrade/data/TaskState;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 103
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

.method public notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 5

    .line 78
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 79
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainApplication;->mUICallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IUICallback;

    .line 82
    iget-object v3, p0, Lcom/yftech/upgrade/app/MainApplication;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/yftech/upgrade/app/MainApplication$2;

    invoke-direct {v4, p0, v2, p1}, Lcom/yftech/upgrade/app/MainApplication$2;-><init>(Lcom/yftech/upgrade/app/MainApplication;Lcom/yftech/upgrade/callback/IUICallback;Lcom/yftech/upgrade/data/TaskState;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 89
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

.method public onCreate()V
    .locals 2

    .line 38
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 40
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->TAG:Ljava/lang/String;

    const-string v1, "onCreate: "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    sput-object p0, Lcom/yftech/upgrade/app/MainApplication;->mMainApplication:Lcom/yftech/upgrade/app/MainApplication;

    .line 44
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/upgrade/data/DataProvider;->parseDownloadRecord(Landroid/content/Context;)V

    .line 46
    invoke-static {}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->init(Landroid/content/Context;)V

    .line 48
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->init(Landroid/content/Context;)V

    return-void
.end method

.method public onTerminate()V
    .locals 1

    .line 54
    invoke-static {}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->release()V

    .line 55
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    return-void
.end method

.method public registerUiCallback(Lcom/yftech/upgrade/callback/IUICallback;)V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 66
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainApplication;->mUICallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainApplication;->mUICallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
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

.method public unregisterUiCallback(Lcom/yftech/upgrade/callback/IUICallback;)V
    .locals 2

    .line 72
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainApplication;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 73
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/app/MainApplication;->mUICallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 74
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
