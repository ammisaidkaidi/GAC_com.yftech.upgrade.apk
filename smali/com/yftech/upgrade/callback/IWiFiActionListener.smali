.class public interface abstract Lcom/yftech/upgrade/callback/IWiFiActionListener;
.super Ljava/lang/Object;
.source "IWiFiActionListener.java"


# virtual methods
.method public onConnectionState(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 0

    return-void
.end method

.method public onScanStatusChanged(Z)V
    .locals 0

    return-void
.end method

.method public onWiFiListChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yftech/upgrade/wifi/WiFiItem;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onWiFiStatusChanged(I)V
    .locals 0

    return-void
.end method
