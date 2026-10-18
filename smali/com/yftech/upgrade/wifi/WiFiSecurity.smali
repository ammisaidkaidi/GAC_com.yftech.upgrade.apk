.class public Lcom/yftech/upgrade/wifi/WiFiSecurity;
.super Ljava/lang/Object;
.source "WiFiSecurity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;
    }
.end annotation


# static fields
.field public static final SECURITY_EAP:I = 0x3

.field public static final SECURITY_NONE:I = 0x0

.field public static final SECURITY_PSK:I = 0x2

.field public static final SECURITY_WEP:I = 0x1

.field public static final STATE_NONE:[I

.field public static final STATE_SECURED:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x7f0401a5

    aput v2, v0, v1

    .line 22
    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity;->STATE_SECURED:[I

    new-array v0, v1, [I

    .line 23
    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity;->STATE_NONE:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPskType(Landroid/net/wifi/ScanResult;)Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;
    .locals 2

    .line 56
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WPA-PSK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 57
    iget-object p0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WPA2-PSK"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    if-eqz v0, :cond_0

    .line 60
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA_WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0

    :cond_0
    if-eqz p0, :cond_1

    .line 62
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0

    :cond_1
    if-eqz v0, :cond_2

    .line 64
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0

    .line 66
    :cond_2
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0
.end method

.method public static getSecurity(Landroid/net/wifi/ScanResult;)I
    .locals 2

    .line 84
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WEP"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 86
    :cond_0
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "PSK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x2

    return p0

    .line 88
    :cond_1
    iget-object p0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v0, "EAP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x3

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public static getSecurity(Landroid/net/wifi/WifiConfiguration;)I
    .locals 3

    .line 73
    iget-object v0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_0

    return v2

    .line 76
    :cond_0
    iget-object v0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v0, v2}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    const/4 v2, 0x3

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v0, v2}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 79
    :cond_1
    iget-object p0, p0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    const/4 v0, 0x0

    aget-object p0, p0, v0

    if-eqz p0, :cond_2

    move v0, v1

    :cond_2
    return v0

    :cond_3
    :goto_0
    return v2
.end method

.method public static getSecurityString(Landroid/content/Context;IIZ)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_b

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    if-eqz p3, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    const p1, 0x7f0e0070

    .line 130
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0

    :cond_1
    if-eqz p3, :cond_2

    const p1, 0x7f0e0072

    goto :goto_1

    :cond_2
    const p1, 0x7f0e006f

    .line 100
    :goto_1
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 103
    :cond_3
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->ordinal()I

    move-result p1

    if-ne p2, p1, :cond_5

    if-eqz p3, :cond_4

    const p1, 0x7f0e0075

    goto :goto_2

    :cond_4
    const p1, 0x7f0e0079

    .line 104
    :goto_2
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 105
    :cond_5
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->ordinal()I

    move-result p1

    if-ne p2, p1, :cond_7

    if-eqz p3, :cond_6

    const p1, 0x7f0e0076

    goto :goto_3

    :cond_6
    const p1, 0x7f0e007a

    .line 106
    :goto_3
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 107
    :cond_7
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA_WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->ordinal()I

    move-result p1

    if-ne p2, p1, :cond_9

    if-eqz p3, :cond_8

    const p1, 0x7f0e0077

    goto :goto_4

    :cond_8
    const p1, 0x7f0e007b

    .line 108
    :goto_4
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 109
    :cond_9
    sget-object p1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-virtual {p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->ordinal()I

    move-result p1

    if-ne p2, p1, :cond_b

    if-eqz p3, :cond_a

    const p1, 0x7f0e0073

    goto :goto_5

    :cond_a
    const p1, 0x7f0e0071

    .line 110
    :goto_5
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    if-eqz p3, :cond_c

    const p1, 0x7f0e0074

    goto :goto_6

    :cond_c
    const p1, 0x7f0e0078

    .line 126
    :goto_6
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSignalImageResouce(ZI)I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public static getWiFiStateDescription(Landroid/content/Context;Landroid/net/NetworkInfo$DetailedState;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 148
    invoke-static {p0, v0, p1}, Lcom/yftech/upgrade/wifi/WiFiSecurity;->getWiFiStateDescription(Landroid/content/Context;Ljava/lang/String;Landroid/net/NetworkInfo$DetailedState;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getWiFiStateDescription(Landroid/content/Context;Ljava/lang/String;Landroid/net/NetworkInfo$DetailedState;)Ljava/lang/String;
    .locals 1

    .line 137
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    if-nez p1, :cond_0

    const/high16 v0, 0x7f030000

    goto :goto_0

    :cond_0
    const v0, 0x7f030001

    :goto_0
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    .line 139
    invoke-virtual {p2}, Landroid/net/NetworkInfo$DetailedState;->ordinal()I

    move-result p2

    .line 141
    array-length v0, p0

    if-ge p2, v0, :cond_2

    aget-object v0, p0, p2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 144
    :cond_1
    aget-object p0, p0, p2

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p2, v0

    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    :cond_0
    return v0
.end method
