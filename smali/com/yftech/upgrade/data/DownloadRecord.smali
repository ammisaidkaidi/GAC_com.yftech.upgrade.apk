.class public Lcom/yftech/upgrade/data/DownloadRecord;
.super Ljava/lang/Object;
.source "DownloadRecord.java"


# instance fields
.field private deviceId:I

.field private mDownloadCode:I

.field private mDownloadPoint:J

.field private md5:Ljava/lang/String;

.field private newVer:Ljava/lang/String;

.field private size:J

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadCode:I

    const-wide/16 v0, 0x0

    .line 13
    iput-wide v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadPoint:J

    const/4 v2, -0x1

    .line 15
    iput v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->deviceId:I

    const-string v2, ""

    .line 16
    iput-object v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->url:Ljava/lang/String;

    .line 17
    iput-object v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->md5:Ljava/lang/String;

    .line 18
    iput-object v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->newVer:Ljava/lang/String;

    .line 19
    iput-wide v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->size:J

    return-void
.end method


# virtual methods
.method public getDeviceId()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->deviceId:I

    return v0
.end method

.method public getDownloadCode()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadCode:I

    return v0
.end method

.method public getDownloadPoint()J
    .locals 2

    .line 91
    iget-wide v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadPoint:J

    return-wide v0
.end method

.method public getMd5()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->md5:Ljava/lang/String;

    return-object v0
.end method

.method public getModule()I
    .locals 3

    .line 99
    invoke-static {}, Lcom/yftech/upgrade/data/ProjectManager;->getInstance()Lcom/yftech/upgrade/data/ProjectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/ProjectManager;->getProjectInfo()Lcom/yftech/upgrade/data/ProjectInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 101
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/ProjectInfo;->getMcuDeviceId()I

    move-result v1

    invoke-virtual {p0}, Lcom/yftech/upgrade/data/DownloadRecord;->getDeviceId()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x2

    return v0

    .line 103
    :cond_0
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/ProjectInfo;->getOSDeviceId()I

    move-result v0

    invoke-virtual {p0}, Lcom/yftech/upgrade/data/DownloadRecord;->getDeviceId()I

    move-result v1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getNewVer()Ljava/lang/String;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->newVer:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->size:J

    return-wide v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/yftech/upgrade/data/DownloadRecord;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceId(I)V
    .locals 0

    .line 55
    iput p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->deviceId:I

    return-void
.end method

.method public setDownloadCode(I)V
    .locals 0

    .line 42
    iput p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadCode:I

    return-void
.end method

.method public setDownloadPoint(J)V
    .locals 0

    .line 95
    iput-wide p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadPoint:J

    return-void
.end method

.method public setMd5(Ljava/lang/String;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->md5:Ljava/lang/String;

    return-void
.end method

.method public setNewVer(Ljava/lang/String;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->newVer:Ljava/lang/String;

    return-void
.end method

.method public setSize(J)V
    .locals 0

    .line 87
    iput-wide p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->size:J

    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/yftech/upgrade/data/DownloadRecord;->url:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 24
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",deviceId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->deviceId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",code:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",point:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->mDownloadPoint:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",md5:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->md5:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",newVer:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->newVer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",url:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ",size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/yftech/upgrade/data/DownloadRecord;->size:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
