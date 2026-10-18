.class public Lcom/yftech/upgrade/data/HttpRequestCell;
.super Ljava/lang/Object;
.source "HttpRequestCell.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/data/HttpRequestCell$Version;
    }
.end annotation


# instance fields
.field private TAG:Ljava/lang/String;

.field public oldVersionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yftech/upgrade/data/HttpRequestCell$Version;",
            ">;"
        }
    .end annotation
.end field

.field private projectName:Ljava/lang/String;

.field public vehicleId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "HttpRequestCell"

    .line 18
    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->TAG:Ljava/lang/String;

    const-string v0, "vehicleId"

    .line 19
    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->vehicleId:Ljava/lang/String;

    const-string v0, ""

    .line 20
    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->projectName:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->oldVersionList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public updateVersion()V
    .locals 6

    .line 36
    iget-object v0, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->oldVersionList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 38
    invoke-static {}, Lcom/yftech/upgrade/data/ProjectManager;->getInstance()Lcom/yftech/upgrade/data/ProjectManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/ProjectManager;->getProjectInfo()Lcom/yftech/upgrade/data/ProjectInfo;

    move-result-object v0

    .line 39
    invoke-static {}, Lcom/yftech/upgrade/manager/VersionManagerGlobal;->getMcuVersion()Ljava/lang/String;

    move-result-object v1

    .line 40
    invoke-static {}, Lcom/yftech/upgrade/manager/VersionManagerGlobal;->getSystemVersion()Ljava/lang/String;

    move-result-object v2

    .line 42
    invoke-static {}, Lcom/yftech/upgrade/data/Config;->getBrand()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->projectName:Ljava/lang/String;

    .line 43
    invoke-static {}, Lcom/yftech/upgrade/data/Config;->getBrandExt()Ljava/lang/String;

    move-result-object v3

    .line 44
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 45
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->projectName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->projectName:Ljava/lang/String;

    :cond_0
    if-eqz v0, :cond_2

    .line 62
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 63
    iget-object v3, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->oldVersionList:Ljava/util/List;

    new-instance v4, Lcom/yftech/upgrade/data/HttpRequestCell$Version;

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/ProjectInfo;->getMcuDeviceId()I

    move-result v5

    invoke-direct {v4, p0, v5, v1}, Lcom/yftech/upgrade/data/HttpRequestCell$Version;-><init>(Lcom/yftech/upgrade/data/HttpRequestCell;ILjava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    :cond_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 67
    iget-object v1, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->oldVersionList:Ljava/util/List;

    new-instance v3, Lcom/yftech/upgrade/data/HttpRequestCell$Version;

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/ProjectInfo;->getOSDeviceId()I

    move-result v0

    invoke-direct {v3, p0, v0, v2}, Lcom/yftech/upgrade/data/HttpRequestCell$Version;-><init>(Lcom/yftech/upgrade/data/HttpRequestCell;ILjava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 70
    :cond_2
    iget-object v0, p0, Lcom/yftech/upgrade/data/HttpRequestCell;->TAG:Ljava/lang/String;

    const-string v1, "updateVersion: project not found"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_0
    return-void
.end method
