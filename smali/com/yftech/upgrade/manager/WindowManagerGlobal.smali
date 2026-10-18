.class public Lcom/yftech/upgrade/manager/WindowManagerGlobal;
.super Ljava/lang/Object;
.source "WindowManagerGlobal.java"


# static fields
.field public static TAG:Ljava/lang/String; = "WindowManagerGlobal"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addView(Landroid/content/Context;Landroid/view/View;IIIII)Z
    .locals 3

    const-string v0, "window"

    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 28
    sget-object v0, Lcom/yftech/upgrade/manager/WindowManagerGlobal;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addView:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_0

    .line 30
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/yftech/upgrade/manager/WindowManagerGlobal;->createWindowManagerLayoutParams(IIII)Landroid/view/WindowManager$LayoutParams;

    move-result-object p3

    .line 32
    iget p4, p3, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/2addr p4, p7

    iput p4, p3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 33
    invoke-interface {p1, p2, p3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    if-eqz p1, :cond_1

    .line 36
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/view/WindowManager$LayoutParams;

    if-eqz p3, :cond_1

    .line 39
    iget p4, p3, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/2addr p4, p7

    iput p4, p3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 40
    invoke-interface {p1, p2, p3}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public createWindowManagerLayoutParams(IIII)Landroid/view/WindowManager$LayoutParams;
    .locals 3

    .line 51
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x7f6

    const/high16 v2, 0x80000

    invoke-direct {v0, v1, v2}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    .line 55
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 57
    iget p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v1, 0x820700

    or-int/2addr p1, v1

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/4 p1, 0x1

    .line 65
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 66
    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 68
    iput p3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 69
    iput p4, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    return-object v0
.end method

.method public removeView(Landroid/content/Context;Landroid/view/View;)Z
    .locals 3

    const-string v0, "window"

    .line 84
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 85
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    sget-object v0, Lcom/yftech/upgrade/manager/WindowManagerGlobal;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeView:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-interface {p1, p2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
