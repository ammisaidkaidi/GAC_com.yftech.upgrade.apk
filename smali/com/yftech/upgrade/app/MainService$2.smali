.class Lcom/yftech/upgrade/app/MainService$2;
.super Lcom/google/gson/reflect/TypeToken;
.source "MainService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/app/MainService;->updateRequestState(Lcom/yftech/upgrade/data/TaskState;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Lcom/yftech/upgrade/data/HttpRespondCell;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/app/MainService;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/app/MainService;)V
    .locals 0

    .line 323
    iput-object p1, p0, Lcom/yftech/upgrade/app/MainService$2;->this$0:Lcom/yftech/upgrade/app/MainService;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
