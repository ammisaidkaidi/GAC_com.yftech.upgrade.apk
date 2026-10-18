.class Lcom/yftech/upgrade/wifi/WiFiActivity$1;
.super Ljava/lang/Object;
.source "WiFiActivity.java"

# interfaces
.implements Landroid/os/Handler$Callback;


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

    .line 47
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 50
    invoke-static {}, Lcom/yftech/upgrade/wifi/WiFiActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleMessage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x10

    if-ne v0, p1, :cond_0

    .line 52
    invoke-static {}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->getInstance()Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal;->resumeScan()V

    .line 53
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->access$100(Lcom/yftech/upgrade/wifi/WiFiActivity;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
