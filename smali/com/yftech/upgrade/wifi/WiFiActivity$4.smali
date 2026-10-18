.class Lcom/yftech/upgrade/wifi/WiFiActivity$4;
.super Ljava/lang/Object;
.source "WiFiActivity.java"

# interfaces
.implements Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/wifi/WiFiActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 93
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$4;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClicked(Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 3

    .line 96
    invoke-static {}, Lcom/yftech/upgrade/wifi/WiFiActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onItemClicked: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$4;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->callBackOnItemClick(Lcom/yftech/upgrade/wifi/WiFiItem;)V

    return-void
.end method
