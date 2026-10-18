.class Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;
.super Ljava/lang/Object;
.source "WiFiManagerGlobal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/manager/WiFiManagerGlobal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Multimap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private store:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TK;",
            "Ljava/util/List<",
            "TV;>;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;


# direct methods
.method private constructor <init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V
    .locals 0

    .line 466
    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->this$0:Lcom/yftech/upgrade/manager/WiFiManagerGlobal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 467
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->store:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;Lcom/yftech/upgrade/manager/WiFiManagerGlobal$1;)V
    .locals 0

    .line 466
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;-><init>(Lcom/yftech/upgrade/manager/WiFiManagerGlobal;)V

    return-void
.end method


# virtual methods
.method getAll(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 471
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->store:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 472
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method put(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 476
    iget-object v0, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->store:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    .line 478
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 479
    iget-object v1, p0, Lcom/yftech/upgrade/manager/WiFiManagerGlobal$Multimap;->store:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
