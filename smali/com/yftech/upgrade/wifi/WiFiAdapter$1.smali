.class Lcom/yftech/upgrade/wifi/WiFiAdapter$1;
.super Ljava/lang/Object;
.source "WiFiAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yftech/upgrade/wifi/WiFiAdapter;->convert(Lcom/yftech/upgrade/wifi/NormalViewHolder;Lcom/yftech/upgrade/wifi/WiFiItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/wifi/WiFiAdapter;

.field final synthetic val$item:Lcom/yftech/upgrade/wifi/WiFiItem;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/wifi/WiFiAdapter;Lcom/yftech/upgrade/wifi/WiFiItem;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    iput-object p2, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;->val$item:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 37
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiAdapter;->access$000(Lcom/yftech/upgrade/wifi/WiFiAdapter;)Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 38
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;->this$0:Lcom/yftech/upgrade/wifi/WiFiAdapter;

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiAdapter;->access$000(Lcom/yftech/upgrade/wifi/WiFiAdapter;)Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;

    move-result-object p1

    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiAdapter$1;->val$item:Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-interface {p1, v0}, Lcom/yftech/upgrade/wifi/WiFiAdapter$ItemClickListener;->onItemClicked(Lcom/yftech/upgrade/wifi/WiFiItem;)V

    :cond_0
    return-void
.end method
