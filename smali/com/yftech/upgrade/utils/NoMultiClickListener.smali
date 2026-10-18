.class public abstract Lcom/yftech/upgrade/utils/NoMultiClickListener;
.super Ljava/lang/Object;
.source "NoMultiClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public MIN_CLICK_DELAY_TIME:I

.field private lastClickViewArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3e8

    .line 19
    iput v0, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->MIN_CLICK_DELAY_TIME:I

    .line 21
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->lastClickViewArray:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3e8

    .line 19
    iput v0, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->MIN_CLICK_DELAY_TIME:I

    .line 21
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->lastClickViewArray:Landroid/util/SparseArray;

    .line 28
    iput p1, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->MIN_CLICK_DELAY_TIME:I

    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 106
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 108
    iget-object v0, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->lastClickViewArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 37
    iget-object v2, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->lastClickViewArray:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const-wide/16 v4, -0x1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long v2, v0, v2

    .line 39
    iget v4, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->MIN_CLICK_DELAY_TIME:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 40
    iget-object v2, p0, Lcom/yftech/upgrade/utils/NoMultiClickListener;->lastClickViewArray:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 41
    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/utils/NoMultiClickListener;->onNoMultiClick(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    const-string p1, "#"

    const-string v0, "onClick: quickly"

    .line 43
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public abstract onNoMultiClick(Landroid/view/View;)V
.end method
