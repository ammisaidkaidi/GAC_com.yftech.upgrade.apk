.class Lcom/yftech/upgrade/data/DataProvider$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "DataProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/data/DataProvider;->parseDownloadRecord(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Ljava/util/List<",
        "Lcom/yftech/upgrade/data/DownloadRecord;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/data/DataProvider;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/data/DataProvider;)V
    .locals 0

    .line 356
    iput-object p1, p0, Lcom/yftech/upgrade/data/DataProvider$1;->this$0:Lcom/yftech/upgrade/data/DataProvider;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
