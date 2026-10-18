.class Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;
.super Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;
.source "UpgradeManagerGlobal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)V
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-direct {p0}, Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpgradeProgress(II)V
    .locals 3

    .line 217
    invoke-super {p0, p1, p2}, Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;->onUpgradeProgress(II)V

    .line 218
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$000(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgradeState,module: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",progress:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v0

    monitor-enter v0

    .line 221
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/yftech/upgrade/data/UpgradeInfo;->setProgress(I)V

    .line 223
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    iget-object v2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$200(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/data/UpgradeInfo;)V

    .line 225
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1, p1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$300(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;II)V

    .line 226
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onUpgradeState(II)V
    .locals 3

    .line 231
    invoke-super {p0, p1, p2}, Lcom/yftech/car/upgrade/CarUpgradeManager$CarUpgradeCallback;->onUpgradeState(II)V

    .line 232
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$000(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgradeState,module: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v0}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v0

    monitor-enter v0

    .line 235
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/yftech/upgrade/data/UpgradeInfo;->setModule(I)V

    .line 236
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/yftech/upgrade/data/UpgradeInfo;->setStatus(I)V

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 240
    :cond_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$400(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;I)V

    goto :goto_0

    .line 244
    :cond_1
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$500(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;I)V

    .line 250
    :goto_0
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    iget-object v2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$100(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;)Lcom/yftech/upgrade/data/UpgradeInfo;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$200(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/data/UpgradeInfo;)V

    .line 251
    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$5;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    invoke-static {v1, p1, p2}, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->access$600(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;II)V

    .line 252
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
