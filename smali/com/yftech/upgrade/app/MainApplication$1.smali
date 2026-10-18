.class Lcom/yftech/upgrade/app/MainApplication$1;
.super Landroid/os/Handler;
.source "MainApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/app/MainApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/app/MainApplication;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/app/MainApplication;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/yftech/upgrade/app/MainApplication$1;->this$0:Lcom/yftech/upgrade/app/MainApplication;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
