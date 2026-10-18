.class Lcom/yftech/upgrade/wifi/WiFiDialog$2;
.super Ljava/lang/Object;
.source "WiFiDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/wifi/WiFiDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/wifi/WiFiDialog;)V
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 117
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090112

    if-eq v0, v1, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090048

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$000(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 126
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090113

    if-ne v0, v1, :cond_2

    .line 127
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$000(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$100(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiItem;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;->connect(Lcom/yftech/upgrade/wifi/WiFiItem;)V

    goto :goto_0

    .line 128
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090049

    if-ne v0, v1, :cond_3

    .line 129
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$000(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$100(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiItem;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;->cancelSave(Lcom/yftech/upgrade/wifi/WiFiItem;)V

    goto :goto_0

    .line 130
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f09004b

    if-ne p1, v0, :cond_4

    .line 131
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$000(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-static {v0}, Lcom/yftech/upgrade/wifi/WiFiDialog;->access$100(Lcom/yftech/upgrade/wifi/WiFiDialog;)Lcom/yftech/upgrade/wifi/WiFiItem;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiDialog$WiFiDialogCallback;->disconnect(Lcom/yftech/upgrade/wifi/WiFiItem;)V

    .line 134
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->dismiss()V

    return-void

    .line 118
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$2;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->dismiss()V

    return-void
.end method
