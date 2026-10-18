.class public Lcom/yftech/upgrade/data/DataProvider;
.super Ljava/lang/Object;
.source "DataProvider.java"


# static fields
.field private static final KEY_DOWNLOAD_RECORD:Ljava/lang/String; = "download_record"

.field private static mInstance:Lcom/yftech/upgrade/data/DataProvider;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mDownloadRecords:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/data/DownloadRecord;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadTasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/data/DownloadRecord;",
            ">;"
        }
    .end annotation
.end field

.field private mLock:Ljava/lang/Object;

.field private mTaskState:Lcom/yftech/upgrade/data/TaskState;

.field public mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "DataProvider"

    .line 30
    iput-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    .line 36
    new-instance v0, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mTaskState:Lcom/yftech/upgrade/data/TaskState;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    return-void
.end method

.method private createDownloadRecord(Lcom/yftech/upgrade/data/HttpRespondCell$Item;)Lcom/yftech/upgrade/data/DownloadRecord;
    .locals 3

    .line 243
    new-instance v0, Lcom/yftech/upgrade/data/DownloadRecord;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/DownloadRecord;-><init>()V

    .line 244
    iget-object v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->md5:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/DownloadRecord;->setMd5(Ljava/lang/String;)V

    .line 245
    iget-object v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/DownloadRecord;->setUrl(Ljava/lang/String;)V

    .line 246
    iget-object v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->newVer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/DownloadRecord;->setNewVer(Ljava/lang/String;)V

    .line 247
    iget-wide v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->size:J

    invoke-virtual {v0, v1, v2}, Lcom/yftech/upgrade/data/DownloadRecord;->setSize(J)V

    .line 248
    iget p1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->deviceId:I

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/DownloadRecord;->setDeviceId(I)V

    const/4 p1, 0x3

    .line 249
    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    return-object v0
.end method

.method public static getInstance()Lcom/yftech/upgrade/data/DataProvider;
    .locals 1

    .line 46
    sget-object v0, Lcom/yftech/upgrade/data/DataProvider;->mInstance:Lcom/yftech/upgrade/data/DataProvider;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/yftech/upgrade/data/DataProvider;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/DataProvider;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/data/DataProvider;->mInstance:Lcom/yftech/upgrade/data/DataProvider;

    .line 49
    :cond_0
    sget-object v0, Lcom/yftech/upgrade/data/DataProvider;->mInstance:Lcom/yftech/upgrade/data/DataProvider;

    return-object v0
.end method

.method private parseDownloadRecord(Lcom/yftech/upgrade/data/HttpRespondCell$Item;)V
    .locals 13

    .line 162
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parseDownloadRecord: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 166
    :try_start_0
    iget-object v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    iget-object v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->md5:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 169
    :cond_0
    iget-wide v1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->size:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    .line 170
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v1, "parseDownloadRecord, size is error, add in record list: "

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    monitor-exit v0

    return-void

    :cond_1
    const/4 v1, 0x0

    .line 175
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/data/DataProvider;->createDownloadRecord(Lcom/yftech/upgrade/data/HttpRespondCell$Item;)Lcom/yftech/upgrade/data/DownloadRecord;

    move-result-object v2

    .line 178
    iget-object v3, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/upgrade/data/DownloadRecord;

    .line 179
    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getDeviceId()I

    move-result v6

    iget v7, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->deviceId:I

    if-eq v6, v7, :cond_2

    goto :goto_0

    .line 183
    :cond_2
    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result v3

    invoke-static {v3, v5}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    move-result-object v3

    .line 184
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 186
    iget-object v7, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->md5:Ljava/lang/String;

    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getMd5()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 187
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    const/4 v8, 0x3

    if-nez v7, :cond_3

    .line 189
    invoke-virtual {v4, v8}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    .line 190
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 191
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v3, "parseDownloadRecord: already finish download, but file is removed, download again"

    invoke-static {p1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 193
    :cond_3
    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v9

    iget-wide v11, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->size:J

    cmp-long p1, v9, v11

    if-eqz p1, :cond_4

    .line 195
    invoke-virtual {v4, v8}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    .line 196
    invoke-static {v3, v5}, Lcom/yftech/upgrade/utils/FileUtils;->deleteFile(Ljava/lang/String;Z)V

    .line 197
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 198
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v3, "parseDownloadRecord: file size not equals, download again"

    invoke-static {p1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 204
    :cond_4
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v9

    invoke-virtual {v4, v9, v10}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadPoint(J)V

    .line 205
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v9

    cmp-long p1, v6, v9

    if-nez p1, :cond_5

    const/4 p1, 0x2

    .line 206
    invoke-virtual {v4, p1}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    goto :goto_1

    .line 208
    :cond_5
    invoke-virtual {v4, v8}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    .line 212
    :goto_1
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "parseDownloadRecord: add download:"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v1, v4

    goto :goto_2

    .line 216
    :cond_6
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v3, "parseDownloadRecord, url or md5 is not same, add in record list: "

    invoke-static {p1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_7
    :goto_2
    if-nez v1, :cond_8

    .line 224
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 225
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getModule()I

    move-result p1

    invoke-static {p1, v5}, Lcom/yftech/upgrade/utils/FileUtils;->getFileName(IZ)Ljava/lang/String;

    move-result-object p1

    .line 228
    invoke-static {p1, v5}, Lcom/yftech/upgrade/utils/FileUtils;->deleteFile(Ljava/lang/String;Z)V

    .line 231
    :cond_8
    invoke-direct {p0}, Lcom/yftech/upgrade/data/DataProvider;->saveDownloadRecord()V

    .line 232
    monitor-exit v0

    return-void

    .line 167
    :cond_9
    :goto_3
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v1, "parseDownloadRecord: url or md5 is null, ignore"

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    .line 232
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private parseDownloadTask(Lcom/yftech/upgrade/data/HttpRespondCell;)V
    .locals 3

    .line 136
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 137
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 139
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    if-nez v1, :cond_0

    .line 140
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v1, "isValidVersion: respondCell is null"

    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    monitor-exit v0

    return-void

    .line 142
    :cond_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    iget-object v1, v1, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    if-nez v1, :cond_1

    .line 143
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v1, "isValidVersion: respondCell.data is null"

    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    monitor-exit v0

    return-void

    .line 145
    :cond_1
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    iget-object v1, v1, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    iget-object v1, v1, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->list:Ljava/util/List;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    iget-object v1, v1, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    iget-object v1, v1, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->list:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2

    goto :goto_1

    .line 152
    :cond_2
    iget-object p1, p1, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    iget-object p1, p1, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->list:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/upgrade/data/HttpRespondCell$Item;

    .line 153
    invoke-direct {p0, v1}, Lcom/yftech/upgrade/data/DataProvider;->parseDownloadRecord(Lcom/yftech/upgrade/data/HttpRespondCell$Item;)V

    goto :goto_0

    .line 156
    :cond_3
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parseDownloadTask: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/data/DataProvider;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    monitor-exit v0

    return-void

    .line 146
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v1, "isValidVersion: respondCell.data.list is null"

    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 148
    invoke-direct {p0}, Lcom/yftech/upgrade/data/DataProvider;->saveDownloadRecord()V

    .line 149
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    .line 157
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private saveDownloadRecord()V
    .locals 4

    .line 386
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 387
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveDownloadRecord, size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/yftech/upgrade/utils/JsonHelper;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 389
    invoke-static {}, Lcom/yftech/upgrade/app/MainApplication;->getMainApplication()Lcom/yftech/upgrade/app/MainApplication;

    move-result-object v2

    const-string v3, "download_record"

    invoke-static {v2, v3, v1}, Lcom/yftech/upgrade/utils/Utils;->putSharedPreferencesString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public addDownloadRecord(Lcom/yftech/upgrade/data/DownloadRecord;)V
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getDownloadRecords()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/yftech/upgrade/data/DownloadRecord;",
            ">;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 91
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 92
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getTaskState()Lcom/yftech/upgrade/data/TaskState;
    .locals 1

    .line 322
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mTaskState:Lcom/yftech/upgrade/data/TaskState;

    return-object v0
.end method

.method public getVersionRespond()Lcom/yftech/upgrade/data/HttpRespondCell;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    return-object v0
.end method

.method public hasDownloadRecord()Z
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 111
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 112
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isDownloadFinish()Z
    .locals 10

    .line 117
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 118
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/data/DownloadRecord;

    .line 119
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadCode()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-ne v5, v3, :cond_1

    .line 120
    monitor-exit v0

    return v4

    :cond_1
    const/4 v3, 0x2

    .line 121
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadCode()I

    move-result v6

    if-ne v3, v6, :cond_0

    .line 122
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_0

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v6

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadPoint()J

    move-result-wide v8

    cmp-long v3, v6, v8

    if-eqz v3, :cond_0

    .line 123
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "isDownloadFinish: fix record data:"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    invoke-virtual {v2, v5}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    .line 125
    monitor-exit v0

    return v4

    :cond_2
    const/4 v1, 0x1

    .line 129
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 131
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isLatestVersion()Z
    .locals 3

    .line 101
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 102
    :try_start_0
    invoke-virtual {p0}, Lcom/yftech/upgrade/data/DataProvider;->isRequestVersion()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 103
    invoke-virtual {p0}, Lcom/yftech/upgrade/data/DataProvider;->hasDownloadRecord()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    monitor-exit v0

    return v2

    .line 105
    :cond_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    .line 106
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isRequestVersion()Z
    .locals 1

    .line 96
    invoke-virtual {p0}, Lcom/yftech/upgrade/data/DataProvider;->getVersionRespond()Lcom/yftech/upgrade/data/HttpRespondCell;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTaskBusying()Z
    .locals 3

    .line 327
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x3

    .line 328
    :try_start_0
    iget-object v2, p0, Lcom/yftech/upgrade/data/DataProvider;->mTaskState:Lcom/yftech/upgrade/data/TaskState;

    invoke-virtual {v2}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 329
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public parseDownloadRecord(Landroid/content/Context;)V
    .locals 4

    .line 349
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 350
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v1, "download_record"

    const-string v2, ""

    .line 353
    invoke-static {p1, v1, v2}, Lcom/yftech/upgrade/utils/Utils;->getSharedPreferencesString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 354
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "parseDownloadRecord: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    new-instance v1, Lcom/yftech/upgrade/data/DataProvider$1;

    invoke-direct {v1, p0}, Lcom/yftech/upgrade/data/DataProvider$1;-><init>(Lcom/yftech/upgrade/data/DataProvider;)V

    .line 357
    invoke-virtual {v1}, Lcom/yftech/upgrade/data/DataProvider$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 359
    invoke-static {p1, v1}, Lcom/yftech/upgrade/utils/JsonHelper;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-eqz p1, :cond_0

    .line 360
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 361
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 364
    :cond_0
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x2

    if-le p1, v1, :cond_1

    .line 365
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v1, "parseDownloadRecord, this is error data, reset list"

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 369
    :cond_1
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yftech/upgrade/data/DownloadRecord;

    const/4 v2, 0x3

    .line 370
    invoke-virtual {v1}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadCode()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 371
    iget-object v2, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 375
    :cond_3
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parseDownloadRecord, result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 377
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 380
    :goto_1
    invoke-direct {p0}, Lcom/yftech/upgrade/data/DataProvider;->saveDownloadRecord()V

    .line 381
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public parseVersionInfo(Landroid/content/Context;)Ljava/lang/String;
    .locals 11

    .line 255
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 256
    :try_start_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 258
    iget-object v2, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    .line 259
    sget-object v3, Lcom/yftech/upgrade/data/ProjectManager;->mInstance:Lcom/yftech/upgrade/data/ProjectManager;

    invoke-virtual {v3}, Lcom/yftech/upgrade/data/ProjectManager;->getProjectInfo()Lcom/yftech/upgrade/data/ProjectInfo;

    move-result-object v3

    if-eqz v2, :cond_4

    .line 264
    iget-object v4, v2, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    if-eqz v4, :cond_3

    .line 267
    iget-object v4, v2, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    iget-object v4, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->list:Ljava/util/List;

    if-eqz v4, :cond_2

    iget-object v4, v2, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    iget-object v4, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->list:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 268
    iget-object v2, v2, Lcom/yftech/upgrade/data/HttpRespondCell;->data:Lcom/yftech/upgrade/data/HttpRespondCell$Info;

    iget-object v2, v2, Lcom/yftech/upgrade/data/HttpRespondCell$Info;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;

    .line 270
    invoke-virtual {v3}, Lcom/yftech/upgrade/data/ProjectInfo;->getOSDeviceId()I

    move-result v5

    iget v6, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->deviceId:I

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-ne v5, v6, :cond_0

    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f0e0042

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->newVer:Ljava/lang/String;

    aput-object v9, v8, v7

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 272
    :cond_0
    invoke-virtual {v3}, Lcom/yftech/upgrade/data/ProjectInfo;->getMcuDeviceId()I

    move-result v5

    iget v6, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->deviceId:I

    if-ne v5, v6, :cond_1

    .line 273
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f0e003f

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->newVer:Ljava/lang/String;

    aput-object v9, v8, v7

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 275
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "deviceId:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->deviceId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 276
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "newVer:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->newVer:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 279
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "notes:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->notes:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 280
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "size:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v6, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->size:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    :try_start_1
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v5

    .line 283
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 284
    invoke-virtual {v6, v5}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 285
    new-instance v5, Ljava/util/Date;

    iget v4, v4, Lcom/yftech/upgrade/data/HttpRespondCell$Item;->createdAt:I

    int-to-long v7, v4

    const-wide/16 v9, 0x3e8

    mul-long/2addr v7, v9

    invoke-direct {v5, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 286
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "createdAt:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v4, "\n"

    .line 287
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v4, "\n"

    .line 288
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    :catch_0
    move-exception v4

    .line 290
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 294
    :cond_2
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v2, "parseVersionInfo: httpRespondCell.data.list is null"

    invoke-static {p1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 297
    :cond_3
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->TAG:Ljava/lang/String;

    const-string v2, "parseVersionInfo: httpRespondCell is null"

    invoke-static {p1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    :cond_4
    :goto_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    .line 302
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public popDownloadTask(Z)Lcom/yftech/upgrade/data/DownloadRecord;
    .locals 3

    .line 307
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 309
    :try_start_0
    iget-object v2, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 311
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/yftech/upgrade/data/DownloadRecord;

    goto :goto_0

    .line 313
    :cond_0
    iget-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/yftech/upgrade/data/DownloadRecord;

    .line 316
    :cond_1
    :goto_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    .line 317
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public resetRespond()V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 71
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/yftech/upgrade/data/DataProvider;->setVersionRespond(Lcom/yftech/upgrade/data/HttpRespondCell;)V

    .line 72
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setVersionRespond(Lcom/yftech/upgrade/data/HttpRespondCell;)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 83
    :try_start_0
    iput-object p1, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    .line 85
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/data/DataProvider;->parseDownloadTask(Lcom/yftech/upgrade/data/HttpRespondCell;)V

    .line 86
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 56
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "DataProvider{"

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 58
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    const-string v2, "\n"

    if-eqz v1, :cond_0

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "respond="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/data/DataProvider;->mVersionRespond:Lcom/yftech/upgrade/data/HttpRespondCell;

    invoke-virtual {v3}, Lcom/yftech/upgrade/data/HttpRespondCell;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mTaskState="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/data/DataProvider;->mTaskState:Lcom/yftech/upgrade/data/TaskState;

    invoke-virtual {v3}, Lcom/yftech/upgrade/data/TaskState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 62
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDownloadRecords="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/yftech/upgrade/utils/Utils;->getListString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDownloadTasks="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadTasks:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/yftech/upgrade/utils/Utils;->getListString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "}"

    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateDownloadRecord(Lcom/yftech/upgrade/data/DownloadRecord;)V
    .locals 5

    .line 334
    iget-object v0, p0, Lcom/yftech/upgrade/data/DataProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 336
    :try_start_0
    iget-object v1, p0, Lcom/yftech/upgrade/data/DataProvider;->mDownloadRecords:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yftech/upgrade/data/DownloadRecord;

    .line 337
    invoke-virtual {v2}, Lcom/yftech/upgrade/data/DownloadRecord;->getDeviceId()I

    move-result v3

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getDeviceId()I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 338
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadCode()I

    move-result v1

    invoke-virtual {v2, v1}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadCode(I)V

    .line 339
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/yftech/upgrade/data/DownloadRecord;->setDownloadPoint(J)V

    .line 343
    :cond_1
    invoke-direct {p0}, Lcom/yftech/upgrade/data/DataProvider;->saveDownloadRecord()V

    .line 344
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
