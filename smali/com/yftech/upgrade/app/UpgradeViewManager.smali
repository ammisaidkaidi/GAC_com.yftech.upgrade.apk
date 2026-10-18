.class public Lcom/yftech/upgrade/app/UpgradeViewManager;
.super Ljava/lang/Object;
.source "UpgradeViewManager.java"


# static fields
.field public static final TYPE_ECALL:I = 0x809


# instance fields
.field private TAG:Ljava/lang/String;

.field private mCallback:Lcom/yftech/upgrade/callback/IUICallback;

.field private mVersionViewRoot:Landroid/view/View;

.field private mWindowManager:Lcom/yftech/upgrade/manager/WindowManagerGlobal;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "UpgradeViewManager"

    .line 32
    iput-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->TAG:Ljava/lang/String;

    .line 299
    new-instance v0, Lcom/yftech/upgrade/app/UpgradeViewManager$5;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/app/UpgradeViewManager$5;-><init>(Lcom/yftech/upgrade/app/UpgradeViewManager;)V

    iput-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mCallback:Lcom/yftech/upgrade/callback/IUICallback;

    .line 38
    new-instance v0, Lcom/yftech/upgrade/manager/WindowManagerGlobal;

    invoke-direct {v0}, Lcom/yftech/upgrade/manager/WindowManagerGlobal;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mWindowManager:Lcom/yftech/upgrade/manager/WindowManagerGlobal;

    .line 40
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->initViews(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/app/UpgradeViewManager;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/app/UpgradeViewManager;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateRequestState(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method static synthetic access$200(Lcom/yftech/upgrade/app/UpgradeViewManager;Lcom/yftech/upgrade/data/TaskState;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateDownloadState(Lcom/yftech/upgrade/data/TaskState;)V

    return-void
.end method

.method private init()V
    .locals 4

    .line 280
    invoke-direct {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateCurrentVersion()V

    const/4 v0, 0x0

    .line 281
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setRightLayoutVisible(Z)V

    .line 283
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/upgrade/data/DataProvider;->getTaskState()Lcom/yftech/upgrade/data/TaskState;

    move-result-object v0

    .line 284
    iget-object v1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 289
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 290
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateRequestState(Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    .line 291
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 292
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateDownloadState(Lcom/yftech/upgrade/data/TaskState;)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x3

    .line 293
    invoke-virtual {v0}, Lcom/yftech/upgrade/data/TaskState;->getType()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 294
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateUpgrade(Lcom/yftech/upgrade/data/TaskState;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private setProgressVisible(Z)V
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f09008f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private updateCurrentVersion()V
    .locals 8

    .line 91
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 93
    invoke-static {}, Lcom/yftech/upgrade/manager/VersionManagerGlobal;->getMcuVersion()Ljava/lang/String;

    move-result-object v1

    .line 94
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0e003f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 96
    invoke-static {}, Lcom/yftech/upgrade/manager/VersionManagerGlobal;->getDisplaySoftwareVersion()Ljava/lang/String;

    .line 97
    invoke-static {}, Lcom/yftech/upgrade/manager/VersionManagerGlobal;->getSystemVersion()Ljava/lang/String;

    move-result-object v2

    .line 99
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v7, 0x7f0e0042

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v2, v4, v6

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    iget-object v1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v2, 0x7f09010a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private updateDownloadState(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 14

    const/4 v0, 0x1

    .line 368
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setRightLayoutVisible(Z)V

    .line 369
    invoke-direct {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressVisible(Z)V

    .line 370
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e004e

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 371
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 372
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getModule()I

    move-result v3

    invoke-static {v3}, Lcom/yftech/upgrade/data/TaskState;->getModuleName(I)Ljava/lang/String;

    move-result-object v3

    .line 373
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0e0038

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v0, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "#"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 375
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v5

    const v6, 0x7f0e004d

    if-nez v5, :cond_0

    .line 377
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 379
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getDuration()J

    move-result-wide v8

    invoke-virtual {p0, v5, v6, v8, v9}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto/16 :goto_1

    :cond_0
    const/4 v5, 0x3

    .line 381
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v8

    const-wide/16 v9, 0x64

    const-wide/high16 v11, 0x4059000000000000L    # 100.0

    const/high16 v13, 0x3f800000    # 1.0f

    if-ne v5, v8, :cond_1

    .line 382
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 384
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v5

    long-to-float v3, v5

    mul-float/2addr v3, v13

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getDuration()J

    move-result-wide v5

    long-to-float v5, v5

    mul-float/2addr v5, v13

    div-float/2addr v3, v5

    float-to-double v5, v3

    mul-double/2addr v5, v11

    double-to-long v5, v5

    .line 385
    invoke-virtual {p0, v5, v6, v9, v10}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto/16 :goto_1

    :cond_1
    const/4 v5, 0x2

    .line 387
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v6

    if-ne v5, v6, :cond_2

    .line 389
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0e0050

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 391
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v5

    long-to-float v3, v5

    mul-float/2addr v3, v13

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getDuration()J

    move-result-wide v5

    long-to-float v5, v5

    mul-float/2addr v5, v13

    div-float/2addr v3, v5

    float-to-double v5, v3

    mul-double/2addr v5, v11

    double-to-long v5, v5

    .line 392
    invoke-virtual {p0, v5, v6, v9, v10}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto/16 :goto_1

    .line 394
    :cond_2
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v5

    if-ne v0, v5, :cond_5

    .line 395
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    const v6, 0x7f0e004f

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 397
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getErrorCode()I

    move-result v5

    if-ne v0, v5, :cond_3

    .line 398
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v6

    const v8, 0x7f0e0034

    invoke-virtual {v6, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 402
    :cond_3
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 403
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0e0037

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 404
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v5, 0x7f0e0052

    invoke-virtual {v2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 407
    :cond_4
    :goto_0
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getDuration()J

    move-result-wide v8

    invoke-virtual {p0, v5, v6, v8, v9}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 410
    :cond_5
    :goto_1
    invoke-virtual {p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result p1

    if-eq v0, p1, :cond_6

    goto :goto_2

    :cond_6
    move v0, v7

    :goto_2
    invoke-virtual {p0, v2, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressMessage(Ljava/lang/String;Z)V

    .line 411
    invoke-virtual {p0, v4}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressSubTitle(Ljava/lang/String;)V

    .line 412
    invoke-virtual {p0, v1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressTitle(Ljava/lang/String;)V

    return-void
.end method

.method private updateRequestState(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 16

    move-object/from16 v0, p0

    const-string v1, ""

    .line 321
    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressSubTitle(Ljava/lang/String;)V

    .line 322
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0e004c

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 325
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/yftech/upgrade/data/DataProvider;->parseVersionInfo(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 327
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v4

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x64

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x3

    if-ne v11, v4, :cond_0

    .line 328
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    const v11, 0x7f0e004d

    invoke-virtual {v4, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 329
    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 330
    invoke-direct {v0, v10}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressVisible(Z)V

    goto/16 :goto_1

    :cond_0
    const/4 v4, 0x2

    .line 331
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v11

    const-string v12, "\n"

    if-ne v4, v11, :cond_4

    .line 332
    invoke-virtual {v0, v3, v10}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateNewVersion(Ljava/lang/String;Z)V

    .line 334
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v4

    const v11, 0x7f0e0050

    invoke-virtual {v4, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 337
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v4

    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DataProvider;->getDownloadRecords()Ljava/util/ArrayList;

    move-result-object v4

    .line 338
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 339
    invoke-static {}, Lcom/yftech/upgrade/data/DataProvider;->getInstance()Lcom/yftech/upgrade/data/DataProvider;

    move-result-object v4

    invoke-virtual {v4, v9}, Lcom/yftech/upgrade/data/DataProvider;->popDownloadTask(Z)Lcom/yftech/upgrade/data/DownloadRecord;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 340
    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v13

    cmp-long v5, v13, v5

    if-lez v5, :cond_3

    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getDownloadPoint()J

    move-result-wide v5

    invoke-virtual {v4}, Lcom/yftech/upgrade/data/DownloadRecord;->getSize()J

    move-result-wide v13

    cmp-long v4, v5, v13

    if-nez v4, :cond_3

    .line 341
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f0e0033

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 344
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const v4, 0x7f0e003e

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 347
    :cond_3
    :goto_0
    invoke-virtual {v0, v7, v8, v7, v8}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 348
    invoke-direct {v0, v10}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressVisible(Z)V

    goto :goto_1

    .line 349
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v4

    if-ne v10, v4, :cond_5

    .line 350
    invoke-direct {v0, v9}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressVisible(Z)V

    .line 351
    invoke-virtual {v0, v3, v9}, Lcom/yftech/upgrade/app/UpgradeViewManager;->updateNewVersion(Ljava/lang/String;Z)V

    .line 353
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const v4, 0x7f0e004f

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 355
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v3

    .line 356
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0e0052

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v15, v3

    move-object v3, v1

    move-object v1, v15

    goto :goto_1

    :cond_5
    move-object v3, v1

    .line 358
    :goto_1
    invoke-virtual {v0, v10}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setRightLayoutVisible(Z)V

    .line 359
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v4

    if-eq v10, v4, :cond_6

    move v9, v10

    :cond_6
    invoke-virtual {v0, v1, v9}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressMessage(Ljava/lang/String;Z)V

    .line 360
    invoke-virtual {v0, v3}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressSubTitle(Ljava/lang/String;)V

    .line 361
    invoke-virtual {v0, v2}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressTitle(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public initViews(Landroid/content/Context;)V
    .locals 3

    .line 45
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0031

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    .line 47
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f09004a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/upgrade/app/UpgradeViewManager$1;

    invoke-direct {v1, p0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager$1;-><init>(Lcom/yftech/upgrade/app/UpgradeViewManager;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f09004f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/upgrade/app/UpgradeViewManager$2;

    invoke-direct {v1, p0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager$2;-><init>(Lcom/yftech/upgrade/app/UpgradeViewManager;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f09004e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/upgrade/app/UpgradeViewManager$3;

    invoke-direct {v1, p0}, Lcom/yftech/upgrade/app/UpgradeViewManager$3;-><init>(Lcom/yftech/upgrade/app/UpgradeViewManager;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f09004c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yftech/upgrade/app/UpgradeViewManager$4;

    invoke-direct {v1, p0, p1}, Lcom/yftech/upgrade/app/UpgradeViewManager$4;-><init>(Lcom/yftech/upgrade/app/UpgradeViewManager;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public remove(Landroid/content/Context;)V
    .locals 2

    .line 272
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->TAG:Ljava/lang/String;

    const-string v1, "remove: "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mWindowManager:Lcom/yftech/upgrade/manager/WindowManagerGlobal;

    iget-object v1, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    invoke-virtual {v0, p1, v1}, Lcom/yftech/upgrade/manager/WindowManagerGlobal;->removeView(Landroid/content/Context;Landroid/view/View;)Z

    .line 275
    invoke-static {}, Lcom/yftech/upgrade/app/MainApplication;->getMainApplication()Lcom/yftech/upgrade/app/MainApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mCallback:Lcom/yftech/upgrade/callback/IUICallback;

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/MainApplication;->unregisterUiCallback(Lcom/yftech/upgrade/callback/IUICallback;)V

    return-void
.end method

.method public setProgress(JJ)V
    .locals 4

    .line 147
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f09008f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 148
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v2, 0x7f090108

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 149
    iget-object v2, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v3, 0x7f09010e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 150
    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 151
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    long-to-int v1, p1

    .line 152
    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    long-to-int p3, p3

    .line 153
    invoke-virtual {v2, p3}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 154
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "%"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setProgressMessage(Ljava/lang/String;Z)V
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f090105

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x0

    .line 135
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    if-nez p2, :cond_0

    const p2, 0x7f06002e

    goto :goto_0

    :cond_0
    const p2, 0x7f060030

    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public setProgressSubTitle(Ljava/lang/String;)V
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f090106

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x0

    .line 129
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 130
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setProgressTitle(Ljava/lang/String;)V
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f090107

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 124
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setRightLayoutVisible(Z)V
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f090091

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public show(Landroid/content/Context;)V
    .locals 10

    .line 258
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->TAG:Ljava/lang/String;

    const-string v1, "show: "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    iget-object v2, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mWindowManager:Lcom/yftech/upgrade/manager/WindowManagerGlobal;

    iget-object v4, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const/16 v5, 0x809

    const/16 v6, 0x11

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/16 v9, 0x8

    move-object v3, p1

    invoke-virtual/range {v2 .. v9}, Lcom/yftech/upgrade/manager/WindowManagerGlobal;->addView(Landroid/content/Context;Landroid/view/View;IIIII)Z

    .line 265
    invoke-static {}, Lcom/yftech/upgrade/app/MainApplication;->getMainApplication()Lcom/yftech/upgrade/app/MainApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mCallback:Lcom/yftech/upgrade/callback/IUICallback;

    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/app/MainApplication;->registerUiCallback(Lcom/yftech/upgrade/callback/IUICallback;)V

    .line 267
    invoke-direct {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->init()V

    return-void
.end method

.method public updateNewVersion(Ljava/lang/String;Z)V
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    const v1, 0x7f090109

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 112
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p2, :cond_0

    const p2, 0x7f060030

    goto :goto_0

    :cond_0
    const p2, 0x7f06002e

    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public updateParking()V
    .locals 2

    .line 159
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e0051

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressTitle(Ljava/lang/String;)V

    const-string v0, ""

    .line 160
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressSubTitle(Ljava/lang/String;)V

    .line 161
    invoke-virtual {p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0e005b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressMessage(Ljava/lang/String;Z)V

    return-void
.end method

.method public updateUpgrade(Lcom/yftech/upgrade/data/TaskState;)V
    .locals 16

    move-object/from16 v0, p0

    .line 166
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0e0051

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressTitle(Ljava/lang/String;)V

    .line 168
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getModule()I

    move-result v1

    .line 169
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getModule()I

    move-result v2

    invoke-static {v2}, Lcom/yftech/upgrade/data/TaskState;->getModuleName(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0e005a

    const v4, 0x7f0e0054

    const-wide/16 v5, 0x0

    const v7, 0x7f0e0055

    const v8, 0x7f0e0059

    const/4 v9, 0x2

    const v10, 0x7f0e0057

    const-wide/16 v11, 0x64

    const/4 v13, 0x0

    const/4 v14, 0x1

    const-string v15, ""

    if-eq v1, v14, :cond_1

    if-eq v1, v9, :cond_0

    goto/16 :goto_1

    .line 175
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getUpdateStatus()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_1

    .line 194
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 195
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto/16 :goto_0

    .line 185
    :pswitch_1
    iget-object v1, v0, Lcom/yftech/upgrade/app/UpgradeViewManager;->mVersionViewRoot:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0e0058

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 177
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 178
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto :goto_0

    .line 181
    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 182
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto :goto_0

    .line 198
    :pswitch_4
    invoke-virtual {v0, v5, v6, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 199
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 191
    :pswitch_5
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 188
    :pswitch_6
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    move-object v15, v1

    goto/16 :goto_1

    .line 205
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getUpdateStatus()I

    move-result v1

    packed-switch v1, :pswitch_data_1

    goto/16 :goto_1

    .line 225
    :pswitch_7
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 226
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto :goto_1

    .line 207
    :pswitch_8
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 208
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto :goto_1

    .line 211
    :pswitch_9
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 212
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getPosition()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    goto :goto_1

    .line 218
    :pswitch_a
    invoke-virtual {v0, v5, v6, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 219
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    goto :goto_1

    .line 215
    :pswitch_b
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    goto :goto_1

    .line 222
    :pswitch_c
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    :goto_1
    const/4 v1, -0x1

    .line 235
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getUpdateStatus()I

    move-result v3

    if-ne v1, v3, :cond_4

    .line 236
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 237
    invoke-virtual/range {p0 .. p0}, Lcom/yftech/upgrade/app/UpgradeViewManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v14, [Ljava/lang/Object;

    aput-object v2, v3, v13

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 238
    invoke-virtual {v0, v14}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setRightLayoutVisible(Z)V

    .line 240
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v1

    if-ne v9, v1, :cond_3

    .line 241
    invoke-virtual {v0, v14}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setRightLayoutVisible(Z)V

    .line 243
    invoke-virtual {v0, v11, v12, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 244
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v14}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressMessage(Ljava/lang/String;Z)V

    const-string v15, "SUCCESS"

    goto :goto_2

    .line 245
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getState()I

    move-result v1

    if-ne v14, v1, :cond_4

    .line 246
    invoke-virtual {v0, v14}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setRightLayoutVisible(Z)V

    .line 248
    invoke-virtual {v0, v11, v12, v11, v12}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgress(JJ)V

    .line 249
    invoke-virtual/range {p1 .. p1}, Lcom/yftech/upgrade/data/TaskState;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v13}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressMessage(Ljava/lang/String;Z)V

    const-string v15, "FAILED"

    .line 253
    :cond_4
    :goto_2
    invoke-virtual {v0, v15}, Lcom/yftech/upgrade/app/UpgradeViewManager;->setProgressSubTitle(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method
