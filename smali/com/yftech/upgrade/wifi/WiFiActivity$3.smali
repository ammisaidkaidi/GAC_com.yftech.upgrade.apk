.class Lcom/yftech/upgrade/wifi/WiFiActivity$3;
.super Ljava/lang/Object;
.source "WiFiActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 79
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$3;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 82
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiActivity$3;->this$0:Lcom/yftech/upgrade/wifi/WiFiActivity;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiActivity;->finish()V

    return-void
.end method
