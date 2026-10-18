.class public final enum Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;
.super Ljava/lang/Enum;
.source "BackpressureOverflowStrategy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

.field public static final enum DROP_LATEST:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

.field public static final enum DROP_OLDEST:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

.field public static final enum ERROR:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 26
    new-instance v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    const/4 v1, 0x0

    const-string v2, "ERROR"

    invoke-direct {v0, v2, v1}, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->ERROR:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    .line 28
    new-instance v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    const/4 v2, 0x1

    const-string v3, "DROP_OLDEST"

    invoke-direct {v0, v3, v2}, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->DROP_OLDEST:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    .line 30
    new-instance v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    const/4 v3, 0x2

    const-string v4, "DROP_LATEST"

    invoke-direct {v0, v4, v3}, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->DROP_LATEST:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    const/4 v0, 0x3

    new-array v0, v0, [Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    .line 21
    sget-object v4, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->ERROR:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    aput-object v4, v0, v1

    sget-object v1, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->DROP_OLDEST:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    aput-object v1, v0, v2

    sget-object v1, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->DROP_LATEST:Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    aput-object v1, v0, v3

    sput-object v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->$VALUES:[Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 21
    const-class v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    return-object p0
.end method

.method public static values()[Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;
    .locals 1

    .line 21
    sget-object v0, Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->$VALUES:[Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    invoke-virtual {v0}, [Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/core/BackpressureOverflowStrategy;

    return-object v0
.end method
