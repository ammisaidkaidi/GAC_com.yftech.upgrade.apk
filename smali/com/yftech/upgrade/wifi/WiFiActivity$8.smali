.class Lcom/yftech/upgrade/wifi/WiFiActivity$8;
.super Ljava/lang/Object;
.source "WiFiActivity.java"

# interfaces
.implements Landroid/net/wifi/WifiManager$ActionListener;


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

    .line 264
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$8;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(I)V
    .locals 3

    .line 270
    invoke-static {}, Lcom/yftech/upgrade/wifi/WiFiActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mForget onFailure:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSuccess()V
    .locals 2

    .line 266
    invoke-static {}, Lcom/yftech/upgrade/wifi/WiFiActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mForget onSuccess"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
