.class public Lcom/yftech/upgrade/data/Config;
.super Ljava/lang/Object;
.source "Config.java"


# static fields
.field public static final CONFIG_FILE_NAME:Ljava/lang/String; = "upgrade.cfg"

.field public static final DEBUG:Z = false

.field public static final DOMAIN_ADDRESS:Ljava/lang/String; = "https://otapi.yftech.com"

.field public static final DOMAIN_ADDRESS_ABROAD:Ljava/lang/String; = "https://gacota.yftech.com"

.field public static final DOMAIN_ADDRESS_TEST:Ljava/lang/String; = "http://192.168.28.119"

.field public static final DOWNLOAD_BUFFER_SIZE:I = 0x2000

.field public static final FILE_BUFFER_SIZE:I = 0xf000

.field public static FILE_NAME_MCU:Ljava/lang/String; = "mcuupgrade.bin"

.field public static FILE_NAME_MCU_MD5:Ljava/lang/String; = "mcuupgrade.md5"

.field public static FILE_NAME_OS:Ljava/lang/String; = "update.zip"

.field public static FILE_NAME_OS_MD5:Ljava/lang/String; = "update.md5"

.field public static final PREFFIX_ABROAD:Ljava/lang/String; = "/ota/checkUpdate"

.field public static UPGRADE_DIR:Ljava/lang/String; = "/sdcard/upgrade/"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildAddress()Ljava/lang/String;
    .locals 2

    .line 49
    invoke-static {}, Lcom/yftech/upgrade/data/ProjectManager;->isAbroadProject()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "https://gacota.yftech.com"

    goto :goto_0

    :cond_0
    const-string v0, "https://otapi.yftech.com"

    .line 52
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/ota/checkUpdate"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getBrand()Ljava/lang/String;
    .locals 1

    .line 57
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    return-object v0
.end method

.method public static getBrandExt()Ljava/lang/String;
    .locals 2

    const-string v0, "ro.product.brand_ext"

    const-string v1, ""

    .line 61
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
