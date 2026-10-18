.class public final synthetic Lio/reactivex/rxjava3/disposables/-$$Lambda$LZ_BIfGL9TNswO27xjoX8B4QTos;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/AutoCloseable;


# instance fields
.field private final synthetic f$0:Lio/reactivex/rxjava3/disposables/Disposable;


# direct methods
.method public synthetic constructor <init>(Lio/reactivex/rxjava3/disposables/Disposable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/reactivex/rxjava3/disposables/-$$Lambda$LZ_BIfGL9TNswO27xjoX8B4QTos;->f$0:Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    iget-object v0, p0, Lio/reactivex/rxjava3/disposables/-$$Lambda$LZ_BIfGL9TNswO27xjoX8B4QTos;->f$0:Lio/reactivex/rxjava3/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/rxjava3/disposables/Disposable;->dispose()V

    return-void
.end method
