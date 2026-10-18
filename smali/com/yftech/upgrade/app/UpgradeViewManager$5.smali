.class Lcom/yftech/upgrade/app/UpgradeViewManager$5;
.super Ljava/lang/Object;
.source "UpgradeViewManager.java"

# interfaces
.implements Lcom/yftech/upgrade/callback/IUICallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/app/UpgradeViewManager;
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

    .line 299
    iput-object p1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$5;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 2

    .line 303
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object p1

    .line 304
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$5;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-static {v0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->access$100(Lcom/yftech/upgrade/app/UpgradeViewManager;Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    .line 306
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 307
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$5;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-static {v0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->access$200(Lcom/yftech/upgrade/app/UpgradeViewManager;Lcom/yftech/upgrade/data/TaskState;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 1

    .line 313
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager$5;->this$0:Lcom/yftech/upgrade/app/UpgradeViewManager;

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateUpgrade(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method
