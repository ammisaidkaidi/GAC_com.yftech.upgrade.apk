.class public Lcom/yftech/upgrade/data/ProjectManager;
.super Ljava/lang/Object;
.source "ProjectManager.java"


# static fields
.field private static ABROAD_PROJECTS:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final CB_A60_ZD_A:Ljava/lang/String; = "A60_ZD_A"

.field public static final CB_A60_ZD_B:Ljava/lang/String; = "A60_ZD_B"

.field public static final CB_A88_ZD_A:Ljava/lang/String; = "A88_ZD_A"

.field public static final CB_A88_ZD_B:Ljava/lang/String; = "A88_ZD_B"

.field public static final CB_IHU12_C1:Ljava/lang/String; = "A79_G"

.field public static final HU23:Ljava/lang/String; = "A29"

.field public static mInstance:Lcom/yftech/upgrade/data/ProjectManager;

.field private static mProjectMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/yftech/upgrade/data/ProjectInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/data/ProjectManager;->ABROAD_PROJECTS:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Lcom/yftech/upgrade/data/ProjectManager$1;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/ProjectManager$1;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mProjectMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-direct {p0}, Lcom/yftech/upgrade/data/ProjectManager;->init()V

    return-void
.end method

.method public static getInstance()Lcom/yftech/upgrade/data/ProjectManager;
    .locals 1

    .line 29
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mInstance:Lcom/yftech/upgrade/data/ProjectManager;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/yftech/upgrade/data/ProjectManager;

    invoke-direct {v0}, Lcom/yftech/upgrade/data/ProjectManager;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mInstance:Lcom/yftech/upgrade/data/ProjectManager;

    .line 32
    :cond_0
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mInstance:Lcom/yftech/upgrade/data/ProjectManager;

    return-object v0
.end method

.method private init()V
    .locals 6

    .line 43
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->ABROAD_PROJECTS:Ljava/util/ArrayList;

    const-string v1, "A60_ZD_A"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->ABROAD_PROJECTS:Ljava/util/ArrayList;

    const-string v1, "A60_ZD_B"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->ABROAD_PROJECTS:Ljava/util/ArrayList;

    const-string v1, "A88_ZD_B"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->ABROAD_PROJECTS:Ljava/util/ArrayList;

    const-string v1, "A88_ZD_A"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mProjectMap:Ljava/util/HashMap;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/yftech/upgrade/data/ProjectInfo;

    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const/4 v4, 0x2

    const/4 v5, 0x1

    invoke-direct {v2, v3, v5, v4}, Lcom/yftech/upgrade/data/ProjectInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mProjectMap:Ljava/util/HashMap;

    new-instance v1, Lcom/yftech/upgrade/data/ProjectInfo;

    const-string v2, "A29"

    invoke-direct {v1, v2, v5, v4}, Lcom/yftech/upgrade/data/ProjectInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/yftech/upgrade/data/ProjectManager;->mProjectMap:Ljava/util/HashMap;

    new-instance v1, Lcom/yftech/upgrade/data/ProjectInfo;

    const-string v2, "A79_G"

    invoke-direct {v1, v2, v5, v4}, Lcom/yftech/upgrade/data/ProjectInfo;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static isAbroadProject()Z
    .locals 2

    .line 67
    invoke-static {}, Lcom/yftech/upgrade/data/Config;->getBrand()Ljava/lang/String;

    move-result-object v0

    .line 68
    sget-object v1, Lcom/yftech/upgrade/data/ProjectManager;->ABROAD_PROJECTS:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public getProjectInfo()Lcom/yftech/upgrade/data/ProjectInfo;
    .locals 4

    .line 56
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 57
    sget-object v1, Lcom/yftech/upgrade/data/ProjectManager;->mProjectMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yftech/upgrade/data/ProjectInfo;

    if-nez v0, :cond_0

    .line 59
    new-instance v0, Lcom/yftech/upgrade/data/ProjectInfo;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/yftech/upgrade/data/ProjectInfo;-><init>(Ljava/lang/String;II)V

    :cond_0
    return-object v0
.end method
