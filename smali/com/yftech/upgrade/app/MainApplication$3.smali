.class Lcom/yftech/upgrade/app/MainApplication$3;
.super Ljava/lang/Object;
.source "MainApplication.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/app/MainApplication;->notifyDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/app/MainApplication;

.field final synthetic val$callback:Lcom/yftech/upgrade/callback/IUICallback;

.field final synthetic val$taskState:Lcom/yftech/upgrade/data/TaskState;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/app/MainApplication;Lcom/yftech/upgrade/callback/IUICallback;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/yftech/upgrade/app/MainApplication$3;->this$0:Lcom/yftech/upgrade/app/MainApplication;

    iput-object p2, p0, Lcom/yftech/upgrade/app/MainApplication$3;->val$callback:Lcom/yftech/upgrade/callback/IUICallback;

    iput-object p3, p0, Lcom/yftech/upgrade/app/MainApplication$3;->val$taskState:Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/yftech/upgrade/app/MainApplication$3;->val$callback:Lcom/yftech/upgrade/callback/IUICallback;

    iget-object v1, p0, Lcom/yftech/upgrade/app/MainApplication$3;->val$taskState:Lcom/yftech/upgrade/data/TaskState;

    invoke-interface {v0, v1}, Lcom/yftech/upgrade/callback/IUICallback;->onDownloadStateChanged(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method
