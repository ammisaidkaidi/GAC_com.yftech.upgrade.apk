.class public final enum Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;
.super Ljava/lang/Enum;
.source "ParallelFailureHandling.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/BiFunction;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;",
        ">;",
        "Lio/reactivex/rxjava3/functions/BiFunction<",
        "Ljava/lang/Long;",
        "Ljava/lang/Throwable;",
        "Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

.field public static final enum ERROR:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

.field public static final enum RETRY:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

.field public static final enum SKIP:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

.field public static final enum STOP:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 27
    new-instance v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    const/4 v1, 0x0

    const-string v2, "STOP"

    invoke-direct {v0, v2, v1}, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->STOP:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    .line 31
    new-instance v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    const/4 v2, 0x1

    const-string v3, "ERROR"

    invoke-direct {v0, v3, v2}, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->ERROR:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    .line 35
    new-instance v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    const/4 v3, 0x2

    const-string v4, "SKIP"

    invoke-direct {v0, v4, v3}, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->SKIP:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    .line 39
    new-instance v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    const/4 v4, 0x3

    const-string v5, "RETRY"

    invoke-direct {v0, v5, v4}, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->RETRY:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    const/4 v0, 0x4

    new-array v0, v0, [Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    .line 23
    sget-object v5, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->STOP:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    aput-object v5, v0, v1

    sget-object v1, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->ERROR:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    aput-object v1, v0, v2

    sget-object v1, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->SKIP:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    aput-object v1, v0, v3

    sget-object v1, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->RETRY:Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    aput-object v1, v0, v4

    sput-object v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->$VALUES:[Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

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

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 23
    const-class v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    return-object p0
.end method

.method public static values()[Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;
    .locals 1

    .line 23
    sget-object v0, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->$VALUES:[Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    invoke-virtual {v0}, [Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Long;Ljava/lang/Throwable;)Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "t1",
            "t2"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "t1",
            "t2"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 23
    check-cast p1, Ljava/lang/Long;

    check-cast p2, Ljava/lang/Throwable;

    invoke-virtual {p0, p1, p2}, Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;->apply(Ljava/lang/Long;Ljava/lang/Throwable;)Lio/reactivex/rxjava3/parallel/ParallelFailureHandling;

    move-result-object p1

    return-object p1
.end method
