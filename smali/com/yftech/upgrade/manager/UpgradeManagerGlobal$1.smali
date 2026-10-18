.class Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;
.super Ljava/lang/Object;
.source "UpgradeManagerGlobal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeInfoChanged(Lcom/yftech/upgrade/data/UpgradeInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

.field final synthetic val$upgradeInfo:Lcom/yftech/upgrade/data/UpgradeInfo;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;Lcom/yftech/upgrade/data/UpgradeInfo;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    iput-object p2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;->val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    iput-object p3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;->val$upgradeInfo:Lcom/yftech/upgrade/data/UpgradeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;->val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    iget-object v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$1;->val$upgradeInfo:Lcom/yftech/upgrade/data/UpgradeInfo;

    invoke-interface {v0, v1}, Lcom/yftech/upgrade/callback/IUpgradeCallback;->onUpgradeChanged(Lcom/yftech/upgrade/data/UpgradeInfo;)V

    return-void
.end method
