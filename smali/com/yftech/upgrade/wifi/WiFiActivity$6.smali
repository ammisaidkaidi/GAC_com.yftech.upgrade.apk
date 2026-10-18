.class Lcom/yftech/upgrade/wifi/WiFiActivity$6;
.super Ljava/lang/Object;
.source "WiFiActivity.java"

# interfaces
.implements Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/wifi/WiFiActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/wifi/WiFiActivity;)V
    .locals 0

    .line 235
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$6;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelSave(Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 2

    .line 249
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result p1

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$6;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-static {v1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->access$300(Lcom/yftech/upgrade/wifi/WiFiActivity;)Landroid/net/wifi/WifiManager$ActionListener;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    return-void
.end method

.method public connect(Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$6;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->submit(Lcom/yftech/upgrade/wifi/WiFiItem;)V

    return-void
.end method

.method public disconnect(Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 1

    .line 243
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->disable(I)V

    .line 244
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->disconnect()V

    return-void
.end method
