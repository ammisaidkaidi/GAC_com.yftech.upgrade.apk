.class public Lcom/yftech/upgrade/data/TaskState;
.super Ljava/lang/Object;
.source "TaskState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/data/TaskState$ENUM_DEVICE_ID;,
        Lcom/yftech/upgrade/data/TaskState$ENUM_MODULE;,
        Lcom/yftech/upgrade/data/TaskState$ENUM_TYPE;,
        Lcom/yftech/upgrade/data/TaskState$ENUM_ERROR;,
        Lcom/yftech/upgrade/data/TaskState$ENUM_STATE;
    }
.end annotation


# instance fields
.field private mDuration:J

.field private mErrorCode:I

.field private mExtraData:Ljava/lang/Object;

.field private mMessage:Ljava/lang/String;

.field private mModule:I

.field private mPosition:J

.field private mState:I

.field private mType:I

.field private mUpdateStatus:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 69
    iput v0, p0, Lcom/yftech/upgrade/data/TaskState;->mType:I

    const/4 v1, 0x0

    .line 70
    iput v1, p0, Lcom/yftech/upgrade/data/TaskState;->mState:I

    .line 72
    iput v1, p0, Lcom/yftech/upgrade/data/TaskState;->mErrorCode:I

    .line 73
    iput v0, p0, Lcom/yftech/upgrade/data/TaskState;->mModule:I

    const-string v1, ""

    .line 75
    iput-object v1, p0, Lcom/yftech/upgrade/data/TaskState;->mMessage:Ljava/lang/String;

    const-wide/16 v1, 0x0

    .line 76
    iput-wide v1, p0, Lcom/yftech/upgrade/data/TaskState;->mPosition:J

    const-wide/16 v1, 0x64

    .line 77
    iput-wide v1, p0, Lcom/yftech/upgrade/data/TaskState;->mDuration:J

    .line 78
    iput v0, p0, Lcom/yftech/upgrade/data/TaskState;->mUpdateStatus:I

    return-void
.end method

.method public static getModuleName(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const-string p0, "other"

    return-object p0

    :cond_0
    const-string p0, "MCU"

    return-object p0

    :cond_1
    const-string p0, "OS"

    return-object p0
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 116
    iget-wide v0, p0, Lcom/yftech/upgrade/data/TaskState;->mDuration:J

    return-wide v0
.end method

.method public getErrorCode()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/yftech/upgrade/data/TaskState;->mErrorCode:I

    return v0
.end method

.method public getExtraData()Ljava/lang/Object;
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/yftech/upgrade/data/TaskState;->mExtraData:Ljava/lang/Object;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/yftech/upgrade/data/TaskState;->mMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getModule()I
    .locals 1

    .line 134
    iget v0, p0, Lcom/yftech/upgrade/data/TaskState;->mModule:I

    return v0
.end method

.method public getPosition()J
    .locals 2

    .line 108
    iget-wide v0, p0, Lcom/yftech/upgrade/data/TaskState;->mPosition:J

    return-wide v0
.end method

.method public getState()I
    .locals 1

    .line 82
    iget v0, p0, Lcom/yftech/upgrade/data/TaskState;->mState:I

    return v0
.end method

.method public getType()I
    .locals 1

    .line 98
    iget v0, p0, Lcom/yftech/upgrade/data/TaskState;->mType:I

    return v0
.end method

.method public getTypeString()Ljava/lang/String;
    .locals 2

    .line 156
    iget v0, p0, Lcom/yftech/upgrade/data/TaskState;->mType:I

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    const-string v0, "TYPE_REQUEST"

    return-object v0

    :cond_0
    const/4 v1, 0x2

    if-ne v1, v0, :cond_1

    const-string v0, "TYPE_DOWNLOAD"

    return-object v0

    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method public getUpdateStatus()I
    .locals 1

    .line 148
    iget v0, p0, Lcom/yftech/upgrade/data/TaskState;->mUpdateStatus:I

    return v0
.end method

.method public setDuration(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 121
    iput-wide p1, p0, Lcom/yftech/upgrade/data/TaskState;->mDuration:J

    :cond_0
    return-void
.end method

.method public setErrorCode(I)V
    .locals 0

    .line 130
    iput p1, p0, Lcom/yftech/upgrade/data/TaskState;->mErrorCode:I

    return-void
.end method

.method public setExtraData(Ljava/lang/Object;)V
    .locals 0

    .line 170
    iput-object p1, p0, Lcom/yftech/upgrade/data/TaskState;->mExtraData:Ljava/lang/Object;

    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/yftech/upgrade/data/TaskState;->mMessage:Ljava/lang/String;

    return-void
.end method

.method public setModule(I)V
    .locals 0

    .line 144
    iput p1, p0, Lcom/yftech/upgrade/data/TaskState;->mModule:I

    return-void
.end method

.method public setPosition(J)V
    .locals 0

    .line 112
    iput-wide p1, p0, Lcom/yftech/upgrade/data/TaskState;->mPosition:J

    return-void
.end method

.method public setState(I)V
    .locals 0

    .line 86
    iput p1, p0, Lcom/yftech/upgrade/data/TaskState;->mState:I

    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 102
    iput p1, p0, Lcom/yftech/upgrade/data/TaskState;->mType:I

    const/4 p1, 0x0

    .line 103
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    const-string p1, ""

    .line 104
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    return-void
.end method

.method public setUpdateStatus(I)V
    .locals 0

    .line 152
    iput p1, p0, Lcom/yftech/upgrade/data/TaskState;->mUpdateStatus:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 187
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 188
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 189
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/upgrade/data/TaskState;->mType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 190
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/upgrade/data/TaskState;->mState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",message:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/upgrade/data/TaskState;->mMessage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",position:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/yftech/upgrade/data/TaskState;->mPosition:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",duration:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/yftech/upgrade/data/TaskState;->mDuration:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 194
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",module:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/upgrade/data/TaskState;->mModule:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",error:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/upgrade/data/TaskState;->mErrorCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
