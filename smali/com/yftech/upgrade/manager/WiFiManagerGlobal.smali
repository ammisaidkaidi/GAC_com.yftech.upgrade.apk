.class public Lcom/yftech/upgrade/manager/WiFiManagerGlobal;
.super Ljava/lang/Object;
.source "WiFiManagerGlobal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;,
        Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;
    }
.end annotation


# static fields
.field private static final WIFI_RESCAN_INTERVAL_MS:I = 0x2710

.field private static mInstance:Lcom/yftech/upgrade/manager/WiFiManagerGlobal; = null

.field private static final tag_scan:I = 0x5010


# instance fields
.field private TAG:Ljava/lang/String;

.field private mActionListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/callback/IWiFiActionListener;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mContext:Landroid/content/Context;

.field private mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mLastInfo:Landroid/net/wifi/WifiInfo;

.field private mLastState:Landroid/net/NetworkInfo$DetailedState;

.field final mReceiver:Landroid/content/BroadcastReceiver;

.field private mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

.field private mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private mWorkHandler:Landroid/os/Handler;

.field private mWorkThread:Landroid/os/HandlerThread;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "WiFiManagerGlobal"

    .line 35
    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->TAG:Ljava/lang/String;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    .line 302
    new-instance v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 447
    new-instance v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$2;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$2;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 455
    new-instance v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$3;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$3;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    return-void
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)Landroid/net/wifi/WifiManager;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object p0
.end method

.method static synthetic access$200(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->updateWifiState(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Z)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->notifyScanStatus(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    return-void
.end method

.method static synthetic access$500(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$602(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiDisplayStatus:Landroid/hardware/display/WifiDisplayStatus;

    return-object p1
.end method

.method private constructWifiItems()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yftech/upgrade/wifi/WiFiItem;",
            ">;"
        }
    .end annotation

    .line 381
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 387
    new-instance v1, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;)V

    .line 389
    iget-object v2, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 391
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiConfiguration;

    .line 392
    new-instance v4, Lcom/yftech/upgrade/wifi/WiFiItem;

    iget-object v5, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5, v3}, Lcom/yftech/upgrade/wifi/WiFiItem;-><init>(Landroid/content/Context;Landroid/net/wifi/WifiConfiguration;)V

    .line 393
    iget-object v3, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v5, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v4, v3, v5}, Lcom/yftech/upgrade/wifi/WiFiItem;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 394
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 395
    invoke-virtual {v4}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSsid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v4}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 399
    :cond_0
    iget-object v2, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 401
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/ScanResult;

    .line 403
    iget-object v4, v3, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    if-eqz v4, :cond_1

    iget-object v4, v3, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, v3, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v5, "[IBSS]"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    .line 408
    iget-object v5, v3, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->getAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/yftech/upgrade/wifi/WiFiItem;

    .line 409
    invoke-virtual {v6, v3}, Lcom/yftech/upgrade/wifi/WiFiItem;->update(Landroid/net/wifi/ScanResult;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v4, 0x1

    goto :goto_2

    :cond_4
    if-nez v4, :cond_1

    .line 413
    new-instance v4, Lcom/yftech/upgrade/wifi/WiFiItem;

    iget-object v5, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5, v3}, Lcom/yftech/upgrade/wifi/WiFiItem;-><init>(Landroid/content/Context;Landroid/net/wifi/ScanResult;)V

    .line 414
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 415
    invoke-virtual {v4}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSsid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v4}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 420
    :cond_5
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0
.end method

.method public static getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;
    .locals 1

    .line 54
    sget-object v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mInstance:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-direct {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mInstance:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    .line 58
    :cond_0
    sget-object v0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mInstance:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    return-object v0
.end method

.method private static newIntentFilter()Landroid/content/IntentFilter;
    .locals 2

    .line 286
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    .line 287
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.wifi.SCAN_RESULTS"

    .line 288
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.wifi.NETWORK_IDS_CHANGED"

    .line 289
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    .line 290
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    .line 291
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.wifi.STATE_CHANGE"

    .line 293
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.net.wifi.RSSI_CHANGED"

    .line 294
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"

    .line 296
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-object v0
.end method

.method private notifyConnectionState(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 3

    .line 241
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 242
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IWiFiActionListener;

    .line 243
    invoke-interface {v2, p1, p2}, Lcom/yftech/upgrade/callback/IWiFiActionListener;->onConnectionState(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 245
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

.method private notifyScanStatus(Z)V
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 226
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IWiFiActionListener;

    .line 227
    invoke-interface {v2, p1}, Lcom/yftech/upgrade/callback/IWiFiActionListener;->onScanStatusChanged(Z)V

    goto :goto_0

    .line 229
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

.method private notifyWiFiList(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yftech/upgrade/wifi/WiFiItem;",
            ">;)V"
        }
    .end annotation

    .line 233
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 234
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IWiFiActionListener;

    .line 235
    invoke-interface {v2, p1}, Lcom/yftech/upgrade/callback/IWiFiActionListener;->onWiFiListChanged(Ljava/util/List;)V

    goto :goto_0

    .line 237
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

.method private startScanEx()V
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->startScan(Landroid/os/WorkSource;)Z

    goto :goto_0

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->TAG:Ljava/lang/String;

    const-string v1, "startScanEx: isWifiEnabled false, ignore"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V
    .locals 1

    .line 428
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 429
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->pause()V

    return-void

    .line 433
    :cond_0
    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-ne p1, v0, :cond_1

    .line 434
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->pauseScan()V

    .line 439
    :cond_1
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastInfo:Landroid/net/wifi/WifiInfo;

    if-eqz p1, :cond_2

    .line 441
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 444
    :cond_2
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-direct {p0, p1, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->notifyConnectionState(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    return-void
.end method

.method private updateWifiState(I)V
    .locals 1

    .line 332
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->notifyWiFiStatus(I)V

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 349
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->close()V

    goto :goto_0

    :cond_1
    return-void

    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 353
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 354
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 355
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->pause()V

    return-void
.end method


# virtual methods
.method public addListener(Lcom/yftech/upgrade/callback/IWiFiActionListener;)V
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 93
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 94
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
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

.method public addNetwork(Landroid/net/wifi/WifiConfiguration;)I
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 172
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    :cond_0
    return p1
.end method

.method public close()V
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    goto :goto_0

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->TAG:Ljava/lang/String;

    const-string v1, "remove: isWifiEnabled false already"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public configValid(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 201
    :cond_0
    invoke-virtual {p1}, Landroid/net/wifi/WifiConfiguration;->getNetworkSelectionStatus()Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;->getNetworkSelectionDisableReason()I

    move-result p1

    const/4 v1, 0x3

    if-ne p1, v1, :cond_1

    return v0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public connect(ILandroid/net/wifi/WifiManager$ActionListener;)V
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1, p2}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    return-void
.end method

.method public connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1, p2}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    return-void
.end method

.method public disable(I)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1}, Landroid/net/wifi/WifiManager;->disableNetwork(I)Z

    return-void
.end method

.method public disconnect()V
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->disconnect()Z

    .line 180
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    return-void
.end method

.method public enable(I)V
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    return-void
.end method

.method public forget(ILandroid/net/wifi/WifiManager$ActionListener;)V
    .locals 1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 156
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Failed to forget invalid network "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "setup"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1, p2}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 162
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->resumeScan()V

    .line 164
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->updateWifiItems()V

    return-void
.end method

.method public getStatus()I
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v0

    return v0
.end method

.method public init(Landroid/content/Context;)V
    .locals 2

    .line 66
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mContext:Landroid/content/Context;

    .line 67
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mContext:Landroid/content/Context;

    const-class v0, Landroid/net/wifi/WifiManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/WifiManager;

    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 68
    new-instance p1, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;)V

    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    .line 71
    new-instance p1, Landroid/os/HandlerThread;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xa

    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 74
    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 76
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->setWorkThread(Landroid/os/HandlerThread;)V

    return-void
.end method

.method public isConnected(Landroid/net/NetworkInfo$DetailedState;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 193
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    if-ne v1, p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public notifyWiFiStatus(I)V
    .locals 3

    .line 217
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 218
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/callback/IWiFiActionListener;

    .line 219
    invoke-interface {v2, p1}, Lcom/yftech/upgrade/callback/IWiFiActionListener;->onWiFiStatusChanged(I)V

    goto :goto_0

    .line 221
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

.method public open()V
    .locals 2

    .line 105
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    goto :goto_0

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->TAG:Ljava/lang/String;

    const-string v1, "open: isWifiEnabled true already"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public pauseScan()V
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->pause()V

    return-void
.end method

.method public reconnect()V
    .locals 1

    .line 213
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->reconnect()Z

    return-void
.end method

.method public removeListener(Lcom/yftech/upgrade/callback/IWiFiActionListener;)V
    .locals 2

    .line 100
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 101
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mActionListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 102
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public resumeScan()V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->resume()V

    :cond_0
    return-void
.end method

.method setWorkThread(Landroid/os/HandlerThread;)V
    .locals 2

    .line 80
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWorkThread:Landroid/os/HandlerThread;

    .line 81
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWorkHandler:Landroid/os/Handler;

    .line 82
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->newIntentFilter()Landroid/content/IntentFilter;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public startScan(Z)V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 127
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mScanner:Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->forceScan()V

    goto :goto_0

    .line 129
    :cond_0
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->resumeScan()V

    :cond_1
    :goto_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->mWorkThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_0
    return-void
.end method

.method public updateWifiItems()V
    .locals 2

    .line 360
    invoke-virtual {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getStatus()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 364
    :cond_0
    invoke-direct {p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->constructWifiItems()Ljava/util/List;

    move-result-object v0

    .line 365
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->notifyWiFiList(Ljava/util/List;)V

    :cond_1
    :goto_0
    return-void
.end method
