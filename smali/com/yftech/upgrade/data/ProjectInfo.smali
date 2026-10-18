.class public Lcom/yftech/upgrade/data/ProjectInfo;
.super Ljava/lang/Object;
.source "ProjectInfo.java"


# instance fields
.field private mMcuDeviceId:I

.field private mOSDeviceId:I

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "NONE"

    .line 11
    iput-object v0, p0, Lcom/yftech/upgrade/data/ProjectInfo;->name:Ljava/lang/String;

    .line 16
    iput-object p1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->name:Ljava/lang/String;

    .line 17
    iput p2, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mOSDeviceId:I

    .line 18
    iput p3, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mMcuDeviceId:I

    return-void
.end method


# virtual methods
.method public getMcuDeviceId()I
    .locals 1

    .line 38
    iget v0, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mMcuDeviceId:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/yftech/upgrade/data/ProjectInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOSDeviceId()I
    .locals 1

    .line 30
    iget v0, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mOSDeviceId:I

    return v0
.end method

.method public setMcuDeviceId(I)V
    .locals 0

    .line 42
    iput p1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mMcuDeviceId:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->name:Ljava/lang/String;

    return-void
.end method

.method public setOSDeviceId(I)V
    .locals 0

    .line 34
    iput p1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mOSDeviceId:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ProjectInfo{name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", mOSDeviceId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mOSDeviceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mMcuDeviceId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yftech/upgrade/data/ProjectInfo;->mMcuDeviceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
