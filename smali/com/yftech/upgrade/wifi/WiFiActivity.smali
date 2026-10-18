.class public Lcom/yftech/upgrade/wifi/WiFiActivity;
.super Landroid/app/Activity;
.source "WiFiActivity.java"

# interfaces
.implements Lcom/yftech/upgrade/callback/IWiFiActionListener;


# static fields
.field private static TAG:Ljava/lang/String; = "WiFiActivity"

.field private static final WIFI_RESCAN_INTERVAL_MS:I = 0x2710


# instance fields
.field private final MSG_SCAN_TIMEOUT:I

.field private mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mDialogClick:Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

.field private mForget:Landroid/net/wifi/WifiManager$ActionListener;

.field private mHandler:Landroid/os/Handler;

.field private mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private mSwitch:Landroid/widget/Switch;

.field private mWiFiAdapter:Lcom/yftech/upgrade/wifi/WiFiAdapter;

.field wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/16 v0, 0x10

    .line 44
    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->MSG_SCAN_TIMEOUT:I

    .line 47
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/yftech/upgrade/wifi/WiFiActivity$1;

    invoke-direct {v1, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$1;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mHandler:Landroid/os/Handler;

    .line 235
    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$6;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$6;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mDialogClick:Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    .line 253
    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$7;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$7;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 264
    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$8;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$8;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mForget:Landroid/net/wifi/WifiManager$ActionListener;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 38
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/wifi/WiFiActivity;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->sendMessageScanWifi()V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/upgrade/wifi/WiFiActivity;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->setWiFiStatus()V

    return-void
.end method

.method static synthetic access$300(Lcom/yftech/upgrade/wifi/WiFiActivity;)Landroid/net/wifi/WifiManager$ActionListener;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mForget:Landroid/net/wifi/WifiManager$ActionListener;

    return-object p0
.end method

.method private dismissWiFiDialog()V
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->dismiss()V

    :cond_0
    const/4 v0, 0x0

    .line 278
    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    return-void
.end method

.method private removeMessageScanWifi()V
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method private requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 1

    .line 314
    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object p1

    invoke-virtual {p1}, Landroid/security/KeyStore;->state()Landroid/security/KeyStore$State;

    move-result-object p1

    sget-object v0, Landroid/security/KeyStore$State;->UNLOCKED:Landroid/security/KeyStore$State;

    if-eq p1, v0, :cond_0

    .line 316
    invoke-static {}, Landroid/security/Credentials;->getInstance()Landroid/security/Credentials;

    move-result-object p1

    invoke-virtual {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/security/Credentials;->unlock(Landroid/content/Context;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private sendMessageScanWifi()V
    .locals 4

    .line 63
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->removeMessageScanWifi()V

    .line 64
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x10

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private setWiFiStatus()V
    .locals 4

    .line 145
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getStatus()I

    move-result v0

    .line 146
    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setWiFiStatus, current: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 149
    :cond_0
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->close()V

    goto :goto_0

    .line 152
    :cond_1
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->open()V

    :goto_0
    return-void
.end method

.method private showWifiDialog(Lcom/yftech/upgrade/wifi/WiFiItem;Z)V
    .locals 3

    .line 221
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->dismissWiFiDialog()V

    .line 222
    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiDialog;

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mDialogClick:Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/yftech/upgrade/wifi/WiFiDialog;-><init>(Landroid/content/Context;Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;Lcom/yftech/upgrade/wifi/WiFiItem;Z)V

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    .line 223
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->setCanceledOnTouchOutside(Z)V

    .line 224
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 225
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x11

    .line 226
    invoke-virtual {p1, v1}, Landroid/view/Window;->setGravity(I)V

    .line 227
    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 228
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->show()V

    .line 229
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {p1, p2}, Lcom/yftech/upgrade/wifi/WiFiDialog;->showConnectView(Z)V

    return-void
.end method

.method private update()V
    .locals 1

    .line 140
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getStatus()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->updateWiFiStatus(I)V

    return-void
.end method

.method private updateWiFiStatus(I)V
    .locals 3

    .line 159
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateWiFiStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->removeMessageScanWifi()V

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    if-eq p1, v1, :cond_2

    const/4 v2, 0x2

    if-eq p1, v2, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 171
    :cond_0
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 172
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 173
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->sendMessageScanWifi()V

    goto :goto_0

    .line 163
    :cond_1
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 164
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0

    .line 176
    :cond_2
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 177
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 178
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mWiFiAdapter:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiAdapter;->setList(Ljava/util/Collection;)V

    goto :goto_0

    .line 167
    :cond_3
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 168
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected callBackOnItemClick(Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 2

    .line 185
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSecurity()I

    move-result v0

    if-nez v0, :cond_0

    .line 186
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v1, "callBackOnItemClick: SECURITY_NONE"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->generateOpenNetworkConfig()V

    .line 188
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    goto/16 :goto_0

    .line 195
    :cond_0
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 196
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 197
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->configValid(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 199
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->isConnected(Landroid/net/NetworkInfo$DetailedState;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 200
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v1, "callBackOnItemClick: disconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 201
    invoke-direct {p0, p1, v0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->showWifiDialog(Lcom/yftech/upgrade/wifi/WiFiItem;Z)V

    goto :goto_0

    .line 203
    :cond_1
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v1, "callBackOnItemClick: connect"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 209
    :cond_2
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 210
    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration;->getNetworkSelectionStatus()Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;->getNetworkSelectionDisableReason()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 211
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v1, "callBackOnItemClick: forget"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result p1

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mForget:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, p1, v1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    :cond_3
    const/4 v0, 0x1

    .line 214
    invoke-direct {p0, p1, v0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->showWifiDialog(Lcom/yftech/upgrade/wifi/WiFiItem;Z)V

    :goto_0
    return-void
.end method

.method public onConnectionState(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 0

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 69
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c0032

    .line 71
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->setContentView(I)V

    const p1, 0x7f090050

    .line 73
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$2;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$2;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f09004d

    .line 79
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$3;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$3;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0900e2

    .line 86
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    const p1, 0x7f0900b4

    .line 87
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 88
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 89
    new-instance p1, Landroidx/recyclerview/widget/DividerItemDecoration;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    .line 91
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 92
    new-instance p1, Lcom/yftech/upgrade/wifi/WiFiAdapter;

    invoke-direct {p1}, Lcom/yftech/upgrade/wifi/WiFiAdapter;-><init>()V

    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mWiFiAdapter:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    .line 93
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mWiFiAdapter:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$4;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$4;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiAdapter;->setItemClickListener(Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;)V

    .line 100
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mWiFiAdapter:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 101
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->update()V

    .line 103
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mSwitch:Landroid/widget/Switch;

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiActivity$5;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/wifi/WiFiActivity$5;-><init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->addListener(Lcom/yftech/upgrade/callback/IWiFiActionListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 133
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->dismissWiFiDialog()V

    .line 134
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->removeListener(Lcom/yftech/upgrade/callback/IWiFiActionListener;)V

    .line 135
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 117
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 118
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->resumeScan()V

    return-void
.end method

.method public onScanStatusChanged(Z)V
    .locals 0

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 124
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 125
    invoke-direct {p0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->removeMessageScanWifi()V

    .line 126
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->pauseScan()V

    return-void
.end method

.method public onWiFiListChanged(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yftech/upgrade/wifi/WiFiItem;",
            ">;)V"
        }
    .end annotation

    .line 324
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/upgrade/wifi/WiFiItem;

    goto :goto_0

    .line 328
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mWiFiAdapter:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/wifi/WiFiAdapter;->setList(Ljava/util/Collection;)V

    return-void
.end method

.method public onWiFiStatusChanged(I)V
    .locals 0

    .line 333
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->updateWiFiStatus(I)V

    return-void
.end method

.method public submit(Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 4

    .line 283
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 284
    invoke-virtual {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 285
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {v2}, Lcom/yftech/upgrade/wifi/WiFiDialog;->dismiss()V

    .line 286
    iput-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->wifiDialog:Lcom/yftech/upgrade/wifi/WiFiDialog;

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 288
    :goto_0
    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "submit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, -0x1

    if-nez v0, :cond_2

    .line 291
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiActivity;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 292
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v1, "submit: 11"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result p1

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, p1, v1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_1

    .line 295
    :cond_1
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v0, "submit: ignore 11"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 297
    :cond_2
    iget p1, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-eq p1, v1, :cond_3

    .line 298
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 299
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->reconnect()V

    .line 300
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v0, "submit: 22"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 303
    :cond_3
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 304
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiActivity;->TAG:Ljava/lang/String;

    const-string v0, "submit: 33"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->reconnect()V

    .line 308
    :goto_1
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->startScan(Z)V

    .line 310
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->updateWifiItems()V

    return-void
.end method
