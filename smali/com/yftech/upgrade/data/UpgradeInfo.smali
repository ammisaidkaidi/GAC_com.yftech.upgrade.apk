.class public Lcom/yftech/upgrade/data/UpgradeInfo;
.super Ljava/lang/Object;
.source "UpgradeInfo.java"


# instance fields
.field private mModule:I

.field private mProgress:I

.field private mStatus:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mModule:I

    .line 15
    iput v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mStatus:I

    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mProgress:I

    return-void
.end method


# virtual methods
.method public getModule()I
    .locals 1

    .line 19
    iget v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mModule:I

    return v0
.end method

.method public getProgress()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mProgress:I

    return v0
.end method

.method public getStatus()I
    .locals 1

    .line 27
    iget v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mStatus:I

    return v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x1

    .line 45
    iput v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mModule:I

    .line 46
    iput v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mStatus:I

    const/4 v0, 0x0

    .line 47
    iput v0, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mProgress:I

    return-void
.end method

.method public setModule(I)V
    .locals 0

    .line 23
    iput p1, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mModule:I

    return-void
.end method

.method public setProgress(I)V
    .locals 0

    .line 41
    iput p1, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mProgress:I

    return-void
.end method

.method public setStatus(I)V
    .locals 0

    .line 32
    iput p1, p0, Lcom/yftech/upgrade/data/UpgradeInfo;->mStatus:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 53
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "module:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/data/UpgradeInfo;->getModule()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",status:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/data/UpgradeInfo;->getStatus()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",progress:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/data/UpgradeInfo;->getProgress()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
