.class public Lcom/yftech/upgrade/wifi/WiFiDialog;
.super Landroid/app/Dialog;
.source "WiFiDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;
    }
.end annotation


# instance fields
.field private editAble:Z

.field private mDialogClick:Landroid/view/View$OnClickListener;

.field private mListener:Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

.field private rootView:Landroid/view/View;

.field private tvPwd:Landroid/widget/TextView;

.field private wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;Lcom/yftech/upgrade/wifi/WiFiItem;Z)V
    .locals 1

    const v0, 0x7f0f01f1

    .line 42
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 114
    new-instance p1, Lcom/yftech/upgrade/wifi/WiFiDialog$2;

    invoke-direct {p1, p0}, Lcom/yftech/upgrade/wifi/WiFiDialog$2;-><init>(Lcom/yftech/upgrade/wifi/WiFiDialog;)V

    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mDialogClick:Landroid/view/View$OnClickListener;

    .line 43
    invoke-virtual {p0, p4}, Lcom/yftech/upgrade/wifi/WiFiDialog;->setEditAble(Z)V

    .line 44
    iput-object p2, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mListener:Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    .line 45
    iput-object p3, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mListener:Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    return-object p0
.end method

.method static synthetic access$100(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiItem;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    return-object p0
.end method


# virtual methods
.method public enableSubmitIfAppropriate()V
    .locals 3

    .line 154
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getWiFiSecurity(Lcom/yftech/upgrade/wifi/WiFiItem;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->length()I

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    .line 155
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getWiFiSecurity(Lcom/yftech/upgrade/wifi/WiFiItem;)I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->length()I

    move-result v0

    const/16 v2, 0x8

    if-ge v0, v2, :cond_2

    :cond_1
    const/4 v0, 0x0

    .line 156
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->setConnectEnabled(Z)V

    goto :goto_0

    .line 158
    :cond_2
    invoke-virtual {p0, v1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->setConnectEnabled(Z)V

    :goto_0
    return-void
.end method

.method public getConfig()Landroid/net/wifi/WifiConfiguration;
    .locals 6

    .line 174
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result v0

    if-eq v0, v2, :cond_0

    invoke-virtual {p0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->isEditAble()Z

    move-result v0

    if-nez v0, :cond_0

    return-object v1

    .line 178
    :cond_0
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 180
    iget-object v3, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    const/4 v4, 0x1

    if-nez v3, :cond_1

    .line 181
    invoke-virtual {v3}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSsid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/yftech/upgrade/wifi/WiFiItem;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 183
    iput-boolean v4, v0, Landroid/net/wifi/WifiConfiguration;->hiddenSSID:Z

    goto :goto_0

    .line 184
    :cond_1
    invoke-virtual {v3}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result v3

    if-ne v3, v2, :cond_2

    .line 185
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {v2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSsid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/yftech/upgrade/wifi/WiFiItem;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    goto :goto_0

    .line 187
    :cond_2
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {v2}, Lcom/yftech/upgrade/wifi/WiFiItem;->getNetworkId()I

    move-result v2

    iput v2, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 190
    :goto_0
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {p0, v2}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getWiFiSecurity(Lcom/yftech/upgrade/wifi/WiFiItem;)I

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_9

    const/16 v5, 0x22

    if-eq v2, v4, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 v4, 0x3

    if-eq v2, v4, :cond_3

    return-object v1

    .line 224
    :cond_3
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 225
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 226
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->length()I

    move-result v1

    goto/16 :goto_1

    .line 212
    :cond_4
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 213
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->length()I

    move-result v1

    if-eqz v1, :cond_a

    .line 214
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[0-9A-Fa-f]{64}"

    .line 215
    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 216
    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_1

    .line 218
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_1

    .line 196
    :cond_6
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 197
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 198
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 199
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->length()I

    move-result v1

    if-eqz v1, :cond_a

    .line 200
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->length()I

    move-result v1

    .line 201
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v4, 0xa

    if-eq v1, v4, :cond_7

    const/16 v4, 0x1a

    if-eq v1, v4, :cond_7

    const/16 v4, 0x3a

    if-ne v1, v4, :cond_8

    :cond_7
    const-string v1, "[0-9A-Fa-f]*"

    .line 203
    invoke-virtual {v2, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 204
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    aput-object v2, v1, v3

    goto :goto_1

    .line 206
    :cond_8
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    goto :goto_1

    .line 192
    :cond_9
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    :cond_a
    :goto_1
    return-object v0
.end method

.method public getWiFiSecurity(Lcom/yftech/upgrade/wifi/WiFiItem;)I
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 150
    :cond_0
    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSecurity()I

    move-result p1

    :goto_0
    return p1
.end method

.method public isEditAble()Z
    .locals 1

    .line 140
    iget-boolean v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->editAble:Z

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 51
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 53
    invoke-virtual {p0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c002d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    .line 55
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090115

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 56
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->wifiItem:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {v1}, Lcom/yftech/upgrade/wifi/WiFiItem;->getSsid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090114

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    .line 65
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->tvPwd:Landroid/widget/TextView;

    new-instance v1, Lcom/yftech/upgrade/wifi/WiFiDialog$1;

    invoke-direct {v1, p0}, Lcom/yftech/upgrade/wifi/WiFiDialog$1;-><init>(Lcom/yftech/upgrade/wifi/WiFiDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 86
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090113

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mDialogClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090112

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mDialogClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f09004b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mDialogClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090049

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mDialogClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090048

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->mDialogClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->setContentView(Landroid/view/View;)V

    .line 96
    invoke-virtual {p0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    const/4 v0, 0x0

    .line 98
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->setConnectEnabled(Z)V

    .line 99
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public setConnectEnabled(Z)V
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->rootView:Landroid/view/View;

    const v1, 0x7f090113

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    .line 165
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    const/4 p1, 0x1

    .line 166
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    :cond_0
    const/16 p1, 0xa0

    .line 168
    invoke-static {p1, p1, p1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    const/4 p1, 0x0

    .line 169
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    :goto_0
    return-void
.end method

.method public setEditAble(Z)V
    .locals 0

    .line 145
    iput-boolean p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog;->editAble:Z

    return-void
.end method

.method public showConnectView(Z)V
    .locals 4

    const v0, 0x7f09008e

    .line 109
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f090090

    .line 110
    invoke-virtual {p0, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
