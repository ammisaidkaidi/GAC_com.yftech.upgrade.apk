.class public Lcom/yftech/upgrade/wifi/WiFiItem;
.super Ljava/lang/Object;
.source "WiFiItem.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/yftech/upgrade/wifi/WiFiItem;",
        ">;"
    }
.end annotation


# instance fields
.field private bssid:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private detailedState:Landroid/net/NetworkInfo$DetailedState;

.field private mRssi:I

.field private networkId:I

.field private pskType:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

.field private scanResult:Landroid/net/wifi/ScanResult;

.field private security:I

.field private ssid:Ljava/lang/String;

.field private wifiConfig:Landroid/net/wifi/WifiConfiguration;

.field private wifiInfo:Landroid/net/wifi/WifiInfo;

.field wpsAvailable:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/wifi/ScanResult;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->pskType:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wpsAvailable:Z

    .line 34
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    .line 35
    invoke-direct {p0, p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->loadScanResult(Landroid/net/wifi/ScanResult;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/wifi/WifiConfiguration;)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->pskType:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wpsAvailable:Z

    .line 40
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    .line 41
    invoke-direct {p0, p2}, Lcom/yftech/upgrade/wifi/WiFiItem;->loadWifiConfiguration(Landroid/net/wifi/WifiConfiguration;)V

    return-void
.end method

.method public static convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private loadScanResult(Landroid/net/wifi/ScanResult;)V
    .locals 2

    .line 83
    iget-object v0, p1, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->bssid:Ljava/lang/String;

    .line 84
    iget-object v0, p1, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    .line 85
    iget v0, p1, Landroid/net/wifi/ScanResult;->level:I

    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    .line 86
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->scanResult:Landroid/net/wifi/ScanResult;

    .line 88
    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getSecurity(Landroid/net/wifi/ScanResult;)I

    move-result v0

    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    .line 90
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget-object v0, p1, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WPS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wpsAvailable:Z

    .line 92
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 93
    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getPskType(Landroid/net/wifi/ScanResult;)Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    move-result-object p1

    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->pskType:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    :cond_1
    const/4 p1, -0x1

    .line 96
    iput p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    return-void
.end method

.method private loadWifiConfiguration(Landroid/net/wifi/WifiConfiguration;)V
    .locals 1

    .line 100
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-static {v0}, Lcom/yftech/upgrade/wifi/WiFiItem;->removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    .line 101
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->BSSID:Ljava/lang/String;

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->bssid:Ljava/lang/String;

    .line 102
    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getSecurity(Landroid/net/wifi/WifiConfiguration;)I

    move-result v0

    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    .line 103
    iget v0, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    const v0, 0x7fffffff

    .line 104
    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    .line 105
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    return-void
.end method

.method public static removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 190
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    const/4 v2, 0x0

    .line 192
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_0

    sub-int/2addr v0, v1

    .line 193
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_0

    .line 194
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public compareTo(Lcom/yftech/upgrade/wifi/WiFiItem;)I
    .locals 4

    .line 54
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    if-nez v0, :cond_0

    return v1

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    if-eqz v0, :cond_1

    return v2

    .line 60
    :cond_1
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    const v3, 0x7fffffff

    if-eq v0, v3, :cond_2

    iget v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    if-ne v0, v3, :cond_2

    return v1

    .line 62
    :cond_2
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    if-ne v0, v3, :cond_3

    iget v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    if-eq v0, v3, :cond_3

    return v2

    .line 66
    :cond_3
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    if-eq v0, v1, :cond_4

    iget v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    if-ne v0, v1, :cond_4

    return v1

    .line 68
    :cond_4
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    if-ne v0, v1, :cond_5

    iget v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    if-eq v0, v1, :cond_5

    return v2

    .line 72
    :cond_5
    iget v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    iget v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    invoke-static {v0, v1}, Landroid/net/wifi/WifiManager;->compareSignalLevel(II)I

    move-result v0

    if-eqz v0, :cond_6

    return v0

    .line 78
    :cond_6
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    iget-object p1, p1, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 13
    check-cast p1, Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->compareTo(Lcom/yftech/upgrade/wifi/WiFiItem;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 46
    instance-of v0, p1, Lcom/yftech/upgrade/wifi/WiFiItem;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 48
    :cond_0
    check-cast p1, Lcom/yftech/upgrade/wifi/WiFiItem;

    invoke-virtual {p0, p1}, Lcom/yftech/upgrade/wifi/WiFiItem;->compareTo(Lcom/yftech/upgrade/wifi/WiFiItem;)I

    move-result p1

    if-nez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public generateOpenNetworkConfig()V
    .locals 2

    .line 176
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    if-nez v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v0, :cond_0

    return-void

    .line 180
    :cond_0
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    iput-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    .line 181
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    invoke-static {v1}, Lcom/yftech/upgrade/wifi/WiFiItem;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 182
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    return-void

    .line 177
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public getConfig()Landroid/net/wifi/WifiConfiguration;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    return-object v0
.end method

.method public getDetailedState()Landroid/net/NetworkInfo$DetailedState;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->detailedState:Landroid/net/NetworkInfo$DetailedState;

    return-object v0
.end method

.method public getLevel()I
    .locals 2

    .line 142
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    const/4 v1, 0x4

    .line 145
    invoke-static {v0, v1}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v0

    return v0
.end method

.method public getNetworkId()I
    .locals 1

    .line 163
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    return v0
.end method

.method public getRssi()I
    .locals 1

    .line 166
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    return v0
.end method

.method public getSecurity()I
    .locals 1

    .line 157
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    return v0
.end method

.method public getSsid()Ljava/lang/String;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    return-object v0
.end method

.method public getWifiItemMsg()Ljava/lang/String;
    .locals 8

    .line 201
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->detailedState:Landroid/net/NetworkInfo$DetailedState;

    if-eqz v0, :cond_0

    .line 202
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getWiFiStateDescription(Landroid/content/Context;Landroid/net/NetworkInfo$DetailedState;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 203
    :cond_0
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    const v1, 0x7fffffff

    const v2, 0x7f0e006c

    if-ne v0, v1, :cond_1

    .line 204
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v1, 0x7f0e0069

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 205
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v1, :cond_b

    .line 206
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 208
    :cond_1
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    const/4 v1, 0x1

    if-eqz v0, :cond_5

    iget v0, v0, Landroid/net/wifi/WifiConfiguration;->status:I

    if-ne v0, v1, :cond_5

    .line 220
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration;->getNetworkSelectionStatus()Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;->getNetworkSelectionDisableReason()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x4

    if-eq v0, v1, :cond_3

    const/4 v1, 0x5

    if-eq v0, v1, :cond_3

    const/4 v1, 0x7

    if-eq v0, v1, :cond_2

    const/16 v1, 0xb

    if-eq v0, v1, :cond_2

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-virtual {v1}, Landroid/net/wifi/WifiConfiguration;->getNetworkSelectionStatus()Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/wifi/WifiConfiguration$NetworkSelectionStatus;->getNetworkSelectionDisableReason()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 230
    :cond_2
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 226
    :cond_3
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v1, 0x7f0e0061

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 222
    :cond_4
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v1, 0x7f0e0062

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 238
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 239
    iget-object v3, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v3, :cond_6

    .line 240
    iget-object v3, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    :cond_6
    iget v2, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    if-eqz v2, :cond_8

    .line 245
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_7

    .line 246
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v3, 0x7f0e006d

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 248
    :cond_7
    iget-object v2, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v3, 0x7f0e006e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_0
    new-array v3, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 250
    iget-object v5, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    iget v6, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    iget-object v7, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->pskType:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-virtual {v7}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->ordinal()I

    move-result v7

    invoke-static {v5, v6, v7, v1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getSecurityString(Landroid/content/Context;IIZ)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    :cond_8
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiConfig:Landroid/net/wifi/WifiConfiguration;

    if-nez v1, :cond_a

    iget-boolean v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wpsAvailable:Z

    if-eqz v1, :cond_a

    .line 255
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_9

    .line 256
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v2, 0x7f0e007f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 258
    :cond_9
    iget-object v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->context:Landroid/content/Context;

    const v2, 0x7f0e0080

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    :cond_a
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_b
    :goto_2
    return-object v0
.end method

.method public update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 130
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->networkId:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 131
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v0

    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    .line 132
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    .line 133
    iput-object p2, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->detailedState:Landroid/net/NetworkInfo$DetailedState;

    goto :goto_0

    .line 134
    :cond_0
    iget-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 135
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->wifiInfo:Landroid/net/wifi/WifiInfo;

    .line 136
    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->detailedState:Landroid/net/NetworkInfo$DetailedState;

    :cond_1
    :goto_0
    return-void
.end method

.method public update(Landroid/net/wifi/ScanResult;)Z
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->ssid:Ljava/lang/String;

    iget-object v1, p1, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getSecurity(Landroid/net/wifi/ScanResult;)I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 112
    iget v0, p1, Landroid/net/wifi/ScanResult;->level:I

    iget v1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    invoke-static {v0, v1}, Landroid/net/wifi/WifiManager;->compareSignalLevel(II)I

    move-result v0

    if-lez v0, :cond_0

    .line 113
    invoke-virtual {p0}, Lcom/yftech/upgrade/wifi/WiFiItem;->getLevel()I

    .line 114
    iget v0, p1, Landroid/net/wifi/ScanResult;->level:I

    iput v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->mRssi:I

    .line 118
    :cond_0
    iget v0, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->security:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 119
    invoke-static {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getPskType(Landroid/net/wifi/ScanResult;)Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    move-result-object p1

    iput-object p1, p0, Lcom/yftech/upgrade/wifi/WiFiItem;->pskType:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method
