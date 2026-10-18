.class Lcom/yftech/upgrade/manager/DownloadManager$2;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Lcom/yftech/upgrade/callback/IDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/manager/DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field fileLength:J

.field final synthetic this$0:Lcom/yftech/upgrade/manager/DownloadManager;

.field timeStamp:J

.field timeTemp:J


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/DownloadManager;)V
    .locals 2

    .line 292
    iput-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->timeStamp:J

    .line 295
    iget-wide v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->timeStamp:J

    iput-wide v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->timeTemp:J

    const-wide/16 v0, 0x0

    .line 296
    iput-wide v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->fileLength:J

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 4

    .line 350
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {v0}, Lcom/yftech/upgrade/manager/DownloadManager;->access$000(Lcom/yftech/upgrade/manager/DownloadManager;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDownloadFileFailure2: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    new-instance v0, Ljava/lang/StringBuffer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 353
    new-instance p1, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {p1}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    const/4 p2, 0x2

    .line 354
    invoke-virtual {p1, p2}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    const/4 p2, 0x1

    .line 355
    invoke-virtual {p1, p2}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 356
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 357
    iget-object p2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {p2, p1}, Lcom/yftech/upgrade/manager/DownloadManager;->access$100(Lcom/yftech/upgrade/manager/DownloadManager;Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method public onFileChanged(IJJ)V
    .locals 6

    .line 301
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 302
    iget-wide v2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->timeTemp:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long p1, v2, v4

    const-wide/16 v2, 0x0

    if-ltz p1, :cond_0

    .line 303
    iput-wide v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->timeTemp:J

    .line 304
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {p1}, Lcom/yftech/upgrade/manager/DownloadManager;->access$000(Lcom/yftech/upgrade/manager/DownloadManager;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onFileChanged: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->fileLength:J

    sub-long v4, p2, v4

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    iput-wide v2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->fileLength:J

    goto :goto_0

    .line 306
    :cond_0
    iget-wide v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->fileLength:J

    cmp-long p1, v2, v0

    if-nez p1, :cond_1

    .line 307
    iput-wide p2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->fileLength:J

    :cond_1
    :goto_0
    cmp-long p1, p2, p4

    if-nez p1, :cond_2

    .line 311
    iput-wide v2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->fileLength:J

    .line 314
    :cond_2
    new-instance p1, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {p1}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    const/4 v0, 0x2

    .line 315
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    const/4 v0, 0x3

    .line 316
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 317
    invoke-virtual {p1, p2, p3}, Lcom/yftech/upgrade/data/TaskState;->setPosition(J)V

    .line 318
    invoke-virtual {p1, p4, p5}, Lcom/yftech/upgrade/data/TaskState;->setDuration(J)V

    .line 320
    iget-object p2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {p2, p1}, Lcom/yftech/upgrade/manager/DownloadManager;->access$200(Lcom/yftech/upgrade/manager/DownloadManager;Lcom/yftech/upgrade/data/TaskState;)V

    .line 322
    iget-object p2, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {p2, p1}, Lcom/yftech/upgrade/manager/DownloadManager;->access$100(Lcom/yftech/upgrade/manager/DownloadManager;Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 328
    iget-object v0, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {v0}, Lcom/yftech/upgrade/manager/DownloadManager;->access$000(Lcom/yftech/upgrade/manager/DownloadManager;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onResponse: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 331
    new-instance v0, Lcom/yftech/upgrade/data/TaskState;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/TaskState;-><init>()V

    const/4 v1, 0x2

    .line 332
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setType(I)V

    .line 334
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 335
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 336
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {p1, p2}, Lcom/yftech/upgrade/manager/DownloadManager;->access$300(Lcom/yftech/upgrade/manager/DownloadManager;Lokhttp3/Response;)V

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 339
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/data/TaskState;->setState(I)V

    .line 340
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onResponse error, code:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", please check it:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 343
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/yftech/upgrade/data/TaskState;->setMessage(Ljava/lang/String;)V

    .line 344
    iget-object p1, p0, Lcom/yftech/upgrade/manager/DownloadManager$2;->this$0:Lcom/yftech/upgrade/manager/DownloadManager;

    invoke-static {p1, v0}, Lcom/yftech/upgrade/manager/DownloadManager;->access$100(Lcom/yftech/upgrade/manager/DownloadManager;Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method
