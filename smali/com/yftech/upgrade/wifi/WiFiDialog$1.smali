.class Lcom/yftech/upgrade/wifi/WiFiDialog$1;
.super Ljava/lang/Object;
.source "WiFiDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/wifi/WiFiDialog;->onCreate(Landroid/os/Bundle;)V
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

    .line 65
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 82
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiDialog$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiDialog;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiDialog;->enableSubmitIfAppropriate()V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
