.class public Lcom/yftech/upgrade/data/HttpRespondCell;
.super Ljava/lang/Object;
.source "HttpRespondCell.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/data/HttpRespondCell$Item;,
        Lcom/yftech/upgrade/data/HttpRespondCell$Info;
    }
.end annotation


# instance fields
.field public code:Ljava/lang/String;

.field public data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

.field public msg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 16
    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRespondCell;->msg:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRespondCell;->code:Ljava/lang/String;

    .line 18
    new-instance v0, Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/data/HttpRespondCell$Info;-><init>(Lcom/yftech/upgrade/data/HttpRespondCell;)V

    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 63
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "\n"

    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    iget-object v2, p0, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    if-eqz v2, :cond_0

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "data:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    invoke-virtual {v3}, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 70
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
