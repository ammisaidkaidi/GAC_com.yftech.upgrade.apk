.class Lcom/yftech/upgrade/app/UpgradeViewManager$4;
.super Lcom/yftech/upgrade/utils/NoMultiClickListener;
.source "UpgradeViewManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/app/UpgradeViewManager;->initViews(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/app/UpgradeViewManager;Landroid/content/Context;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$4;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    iput-object p2, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$4;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Lcom/yftech/upgrade/utils/NoMultiClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onNoMultiClick(Landroid/view/View;)V
    .locals 1

    .line 79
    iget-object p1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$4;->val$context:Landroid/content/Context;

    const-string v0, "request_download"

    invoke-static {p1, v0}, Lcom/yftech/upgrade/utils/Utils;->startService(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
