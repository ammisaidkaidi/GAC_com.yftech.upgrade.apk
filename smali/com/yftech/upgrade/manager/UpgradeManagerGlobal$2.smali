.class Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;
.super Ljava/lang/Object;
.source "UpgradeManagerGlobal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

.field final synthetic val$taskState:Lcom/yftech/upgrade/data/TaskState;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    iput-object p2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;->val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    iput-object p3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;->val$taskState:Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 184
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;->val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$2;->val$taskState:Lcom/yftech/upgrade/data/TaskState;

    invoke-interface {v0, v1}, Lcom/yftech/upgrade/callback/IUpgradeCallback;->onUpgradeState(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method
