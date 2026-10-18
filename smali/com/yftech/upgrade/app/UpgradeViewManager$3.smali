.class Lcom/yftech/upgrade/app/UpgradeViewManager$3;
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


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/app/UpgradeViewManager;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$3;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-direct {p0}, Lcom/yftech/upgrade/utils/NoMultiClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onNoMultiClick(Landroid/view/View;)V
    .locals 3

    .line 66
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object p1

    .line 67
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$3;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-static {v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->access$000(Lcom/yftech/upgrade/app/UpgradeViewManager;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNoMultiClick: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v1, v0, :cond_0

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result p1

    if-ne v1, p1, :cond_0

    .line 69
    iget-object p1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$3;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-static {p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->access$000(Lcom/yftech/upgrade/app/UpgradeViewManager;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "onNoMultiClick: now is upgrading, forbid any actions"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 72
    :cond_0
    iget-object p1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$3;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->remove(Landroid/content/Context;)V

    return-void
.end method
