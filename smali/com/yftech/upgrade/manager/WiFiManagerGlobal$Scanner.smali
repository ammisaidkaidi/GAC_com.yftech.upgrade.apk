.class Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;
.super Landroid/os/Handler;
.source "WiFiManagerGlobal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/manager/WiFiManagerGlobal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Scanner"
.end annotation


# instance fields
.field private mRetry:I

.field final synthetic this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;


# direct methods
.method private constructor <init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V
    .locals 0

    .line 248
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const/4 p1, 0x0

    .line 249
    iput p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->mRetry:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;)V
    .locals 0

    .line 248
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V

    return-void
.end method


# virtual methods
.method forceScan()V
    .locals 1

    const/4 v0, 0x0

    .line 258
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->removeMessages(I)V

    .line 259
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->sendEmptyMessage(I)Z

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 270
    :try_start_0
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-static {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)Landroid/net/wifi/WifiManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->startScan()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 271
    iput v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->mRetry:I

    goto :goto_0

    .line 272
    :cond_0
    iget p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->mRetry:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->mRetry:I

    const/4 v1, 0x3

    if-lt p1, v1, :cond_1

    .line 273
    iput v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->mRetry:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 280
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method pause()V
    .locals 1

    const/4 v0, 0x0

    .line 263
    iput v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->mRetry:I

    .line 264
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->removeMessages(I)V

    return-void
.end method

.method resume()V
    .locals 2

    const/4 v0, 0x0

    .line 252
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 253
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Scanner;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method
