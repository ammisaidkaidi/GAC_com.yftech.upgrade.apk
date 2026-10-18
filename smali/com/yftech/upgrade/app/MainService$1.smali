.class Lcom/yftech/upgrade/app/MainService$1;
.super Ljava/lang/Object;
.source "MainService.java"

# interfaces
.implements Lcom/yftech/upgrade/callback/IDownloadListener;


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

    .line 287
    iput-object p1, p0, Lcom/yftech/upgrade/app/MainService$1;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadPositionChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    return-void
.end method

.method public onDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 3

    .line 297
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService$1;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {v0}, Lcom/yftech/upgrade/app/MainService;->access$000(Lcom/yftech/upgrade/app/MainService;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDownloadStateChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    goto :goto_0

    .line 301
    :cond_0
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    :goto_0
    const/4 v0, 0x1

    .line 305
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 306
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService$1;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {v0, p1}, Lcom/yftech/upgrade/app/MainService;->access$100(Lcom/yftech/upgrade/app/MainService;Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_1

    .line 307
    :cond_1
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v0

    if-ne v1, v0, :cond_2

    .line 308
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainService$1;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {v0, p1}, Lcom/yftech/upgrade/app/MainService;->access$200(Lcom/yftech/upgrade/app/MainService;Lcom/yftech/upgrade/data/TaskState;)V

    .line 311
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/yftech/upgrade/app/MainService$1;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-static {p1}, Lcom/yftech/upgrade/app/MainService;->access$300(Lcom/yftech/upgrade/app/MainService;)V

    return-void
.end method
