.class Lcom/yftech/upgrade/app/MainService$3;
.super Ljava/lang/Object;
.source "MainService.java"

# interfaces
.implements Lcom/yftech/upgrade/callback/IUpgradeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/app/MainService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/app/MainService;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/app/MainService;)V
    .locals 0

    .line 373
    iput-object p1, p0, Lcom/yftech/upgrade/app/MainService$3;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpgradeChanged(Lcom/yftech/upgrade/data/UpgradeInfo;)V
    .locals 2

    .line 377
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/UpgradeInfo;->getStatus()I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    goto :goto_0

    .line 379
    :cond_0
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/UpgradeInfo;->getStatus()I

    .line 383
    :goto_0
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService$3;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {p1}, Lcom/yftech/upgrade/app/MainService;->access$400(Lcom/yftech/upgrade/app/MainService;)V

    return-void
.end method

.method public onUpgradeProgress(II)V
    .locals 2

    .line 388
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object p1

    int-to-long v0, p2

    .line 389
    invoke-virtual {p1, v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    const-wide/16 v0, 0x3e8

    .line 390
    invoke-virtual {p1, v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 391
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService$3;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {p1}, Lcom/yftech/upgrade/app/MainService;->access$400(Lcom/yftech/upgrade/app/MainService;)V

    return-void
.end method

.method public onUpgradeState(II)V
    .locals 1

    .line 396
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    .line 397
    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/TaskState;->setModule(I)V

    .line 398
    invoke-virtual {v0, p2}, Lcom/yftech/upgrade/data/TaskState;->setUpdateStatus(I)V

    .line 399
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService$3;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {p1}, Lcom/yftech/upgrade/app/MainService;->access$400(Lcom/yftech/upgrade/app/MainService;)V

    return-void
.end method

.method public onUpgradeState(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 2

    .line 404
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    .line 405
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 406
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    return-void
.end method
