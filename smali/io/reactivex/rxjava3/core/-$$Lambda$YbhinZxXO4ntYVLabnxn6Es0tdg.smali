.class public final synthetic Lio/reactivex/rxjava3/core/-$$Lambda$YbhinZxXO4ntYVLabnxn6Es0tdg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Function;


# static fields
.field public static final synthetic INSTANCE:Lio/reactivex/rxjava3/core/-$$Lambda$YbhinZxXO4ntYVLabnxn6Es0tdg;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lio/reactivex/rxjava3/core/-$$Lambda$YbhinZxXO4ntYVLabnxn6Es0tdg;

    invoke-direct {v0}, Lio/reactivex/rxjava3/core/-$$Lambda$YbhinZxXO4ntYVLabnxn6Es0tdg;-><init>()V

    sput-object v0, Lio/reactivex/rxjava3/core/-$$Lambda$YbhinZxXO4ntYVLabnxn6Es0tdg;->INSTANCE:Lio/reactivex/rxjava3/core/-$$Lambda$YbhinZxXO4ntYVLabnxn6Es0tdg;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-static {p1}, Lio/reactivex/rxjava3/core/Flowable;->just(Ljava/lang/Object;)Lio/reactivex/rxjava3/core/Flowable;

    move-result-object p1

    return-object p1
.end method
