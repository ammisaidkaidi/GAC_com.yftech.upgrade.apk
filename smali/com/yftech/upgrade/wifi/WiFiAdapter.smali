.class public Lcom/yftech/upgrade/wifi/WiFiAdapter;
.super Lcom/chad/library/adapter/base/BaseQuickAdapter;
.source "WiFiAdapter.java"

# interfaces
.implements Landroid/widget/SectionIndexer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/chad/library/adapter/base/BaseQuickAdapter<",
        "Lcom/yftech/upgrade/wifi/WiFiItem;",
        "Lcom/yftech/upgrade/wifi/NormalViewHolder;",
        ">;",
        "Landroid/widget/SectionIndexer;"
    }
.end annotation


# instance fields
.field private mItemClickListener:Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    const v0, 0x7f0c002e

    .line 19
    invoke-direct {p0, v0}, Lcom/chad/library/adapter/base/BaseQuickAdapter;-><init>(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/wifi/WiFiAdapter;)Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter;->mItemClickListener:Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;

    return-object p0
.end method


# virtual methods
.method protected bridge synthetic convert(Lcom/chad/library/adapter/base/viewholder/BaseViewHolder;Ljava/lang/Object;)V
    .locals 0

    .line 15
    check-cast p1, Lcom/yftech/upgrade/wifi/NormalViewHolder;

    check-cast p2, Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {p0, p1, p2}, Lcom/yftech/upgrade/wifi/WiFiAdapter;->convert(Lcom/yftech/upgrade/wifi/NormalViewHolder;Lcom/yftech/upgrade/wifi/WiFiItem;)V

    return-void
.end method

.method protected convert(Lcom/yftech/upgrade/wifi/NormalViewHolder;Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 3

    const v0, 0x7f090102

    .line 24
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/NormalViewHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSsid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f090101

    .line 25
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/NormalViewHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getWifiItemMsg()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f090087

    .line 26
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/NormalViewHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 27
    invoke-virtual {p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getRssi()I

    move-result v1

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 30
    :cond_0
    invoke-virtual {p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getLevel()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageLevel(I)V

    const v1, 0x7f08007f

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 32
    invoke-virtual {p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSecurity()I

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiSecurity;->STATE_SECURED:[I

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiSecurity;->STATE_NONE:[I

    :goto_0
    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setImageState([IZ)V

    :goto_1
    const v0, 0x7f09008d

    .line 34
    invoke-virtual {p1, v0}, Lcom/yftech/upgrade/wifi/NormalViewHolder;->getView(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;

    invoke-direct {v0, p0, p2}, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;-><init>(Lcom/yftech/upgrade/wifi/WiFiAdapter;Lcom/yftech/upgrade/wifi/WiFiItem;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public getPositionForSection(I)I
    .locals 0

    const/4 p1, -0x1

    return p1
.end method

.method public getSectionForPosition(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getSections()[Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public setItemClickListener(Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter;->mItemClickListener:Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;

    return-void
.end method
