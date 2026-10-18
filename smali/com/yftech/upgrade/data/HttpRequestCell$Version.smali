.class public Lcom/yftech/upgrade/data/HttpRequestCell$Version;
.super Ljava/lang/Object;
.source "HttpRequestCell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/data/HttpRequestCell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Version"
.end annotation


# instance fields
.field public deviceId:I

.field final synthetic this$0:Lcom/yftech/upgrade/data/HttpRequestCell;

.field public version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/yftech/upgrade/data/HttpRequestCell;ILjava/lang/String;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/yftech/upgrade/data/HttpRequestCell$Version;->this$0:Lcom/yftech/upgrade/data/HttpRequestCell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lcom/yftech/upgrade/data/HttpRequestCell$Version;->deviceId:I

    const-string p1, ""

    .line 26
    iput-object p1, p0, Lcom/yftech/upgrade/data/HttpRequestCell$Version;->version:Ljava/lang/String;

    .line 29
    iput p2, p0, Lcom/yftech/upgrade/data/HttpRequestCell$Version;->deviceId:I

    .line 30
    iput-object p3, p0, Lcom/yftech/upgrade/data/HttpRequestCell$Version;->version:Ljava/lang/String;

    return-void
.end method
