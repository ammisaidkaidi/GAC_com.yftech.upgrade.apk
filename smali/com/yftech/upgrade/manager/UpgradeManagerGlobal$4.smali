.class Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;
.super Ljava/lang/Object;
.source "UpgradeManagerGlobal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;->notifyUpgradeProgressChanged(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

.field final synthetic val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

.field final synthetic val$module:I

.field final synthetic val$progress:I


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;Lcom/yftech/upgrade/callback/IUpgradeCallback;II)V
    .locals 0

    .line 205
    iput-object p1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->this$0:Lcom/yftech/upgrade/manager/UpgradeManagerGlobal;

    iput-object p2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    iput p3, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->val$module:I

    iput p4, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->val$progress:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 208
    iget-object v0, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->val$callback:Lcom/yftech/upgrade/callback/IUpgradeCallback;

    iget v1, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->val$module:I

    iget v2, p0, Lcom/yftech/upgrade/manager/UpgradeManagerGlobal$4;->val$progress:I

    invoke-interface {v0, v1, v2}, Lcom/yftech/upgrade/callback/IUpgradeCallback;->onUpgradeProgress(II)V

    return-void
.end method
