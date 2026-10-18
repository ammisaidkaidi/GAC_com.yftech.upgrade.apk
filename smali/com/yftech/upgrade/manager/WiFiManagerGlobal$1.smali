.class Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;
.super Landroid/content/BroadcastReceiver;
.source "WiFiManagerGlobal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/manager/WiFiManagerGlobal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V
    .locals 0

    .line 302
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 305
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.net.wifi.WIFI_STATE_CHANGED"

    .line 308
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 309
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    const/4 v0, 0x4

    const-string v1, "wifi_state"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-static {p1, p2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$200(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;I)V

    goto/16 :goto_1

    :cond_0
    const-string v0, "android.net.wifi.SCAN_RESULTS"

    .line 310
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    .line 311
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "android.net.wifi.LINK_CONFIGURATION_CHANGED"

    .line 312
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const-string v0, "android.net.wifi.supplicant.STATE_CHANGE"

    .line 315
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "newState"

    .line 316
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/SupplicantState;

    .line 317
    iget-object p2, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-static {p1}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$400(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_1

    :cond_2
    const-string v0, "android.net.wifi.STATE_CHANGE"

    .line 318
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p1, "networkInfo"

    .line 319
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/NetworkInfo;

    .line 320
    iget-object p2, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-static {p2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$500(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "info.isConnected()="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    iget-object p2, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-virtual {p2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->updateWifiItems()V

    .line 322
    iget-object p2, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$400(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_1

    :cond_3
    const-string v0, "android.net.wifi.RSSI_CHANGED"

    .line 323
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 324
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$400(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_1

    .line 325
    :cond_4
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 326
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    const-string v0, "android.hardware.display.extra.WIFI_DISPLAY_STATUS"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/hardware/display/WifiDisplayStatus;

    invoke-static {p1, p2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$602(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Landroid/hardware/display/WifiDisplayStatus;)Landroid/hardware/display/WifiDisplayStatus;

    goto :goto_1

    .line 313
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->access$300(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Z)V

    .line 314
    iget-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->updateWifiItems()V

    :cond_6
    :goto_1
    return-void
.end method
