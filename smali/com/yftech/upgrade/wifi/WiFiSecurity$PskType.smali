.class public final enum Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;
.super Ljava/lang/Enum;
.source "WiFiSecurity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/wifi/WiFiSecurity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PskType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

.field public static final enum UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

.field public static final enum WPA:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

.field public static final enum WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

.field public static final enum WPA_WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 32
    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v1, 0x0

    const-string v2, "UNKNOWN"

    invoke-direct {v0, v2, v1}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v2, 0x1

    const-string v3, "WPA"

    invoke-direct {v0, v3, v2}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v3, 0x2

    const-string v4, "WPA2"

    invoke-direct {v0, v4, v3}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    new-instance v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v4, 0x3

    const-string v5, "WPA_WPA2"

    invoke-direct {v0, v5, v4}, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA_WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    .line 31
    sget-object v5, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    aput-object v5, v0, v1

    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA_WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->$VALUES:[Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getPskType(I)Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;
    .locals 1

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 44
    :cond_0
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA_WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0

    .line 42
    :cond_1
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA2:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0

    .line 40
    :cond_2
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->WPA:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0

    .line 38
    :cond_3
    sget-object p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->UNKNOWN:Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;
    .locals 1

    .line 31
    const-class v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object p0
.end method

.method public static values()[Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;
    .locals 1

    .line 31
    sget-object v0, Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->$VALUES:[Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    invoke-virtual {v0}, [Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/yftech/upgrade/wifi/WiFiSecurity$PskType;

    return-object v0
.end method
