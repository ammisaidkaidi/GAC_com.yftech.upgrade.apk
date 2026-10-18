.class public Lcom/yftech/upgrade/manager/CarStateManager;
.super Ljava/lang/Object;
.source "CarStateManager.java"


# static fields
.field private static mInstance:Lcom/yftech/upgrade/manager/CarStateManager;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mCarInfoListener:Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;

.field mGearPosition:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CarStateManager"

    .line 16
    iput-object v0, p0, Lcom/yftech/upgrade/manager/CarStateManager;->TAG:Ljava/lang/String;

    .line 41
    new-instance v0, Lcom/yftech/upgrade/manager/CarStateManager$1;

    invoke-direct {v0, p0}, Lcom/yftech/upgrade/manager/CarStateManager$1;-><init>(Lcom/yftech/upgrade/manager/CarStateManager;)V

    iput-object v0, p0, Lcom/yftech/upgrade/manager/CarStateManager;->mCarInfoListener:Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;

    return-void
.end method

.method static synthetic access$000(Lcom/yftech/upgrade/manager/CarStateManager;Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/yftech/upgrade/manager/CarStateManager;->updateGearPosition(Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;)V

    return-void
.end method

.method public static getInstance()Lcom/yftech/upgrade/manager/CarStateManager;
    .locals 1

    .line 21
    sget-object v0, Lcom/yftech/upgrade/manager/CarStateManager;->mInstance:Lcom/yftech/upgrade/manager/CarStateManager;

    if-nez v0, :cond_0

    .line 22
    new-instance v0, Lcom/yftech/upgrade/manager/CarStateManager;

    invoke-direct {v0}, Lcom/yftech/upgrade/manager/CarStateManager;-><init>()V

    sput-object v0, Lcom/yftech/upgrade/manager/CarStateManager;->mInstance:Lcom/yftech/upgrade/manager/CarStateManager;

    .line 24
    :cond_0
    sget-object v0, Lcom/yftech/upgrade/manager/CarStateManager;->mInstance:Lcom/yftech/upgrade/manager/CarStateManager;

    return-object v0
.end method

.method private updateGearPosition(Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/yftech/upgrade/manager/CarStateManager;->mGearPosition:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    return-void
.end method


# virtual methods
.method public isParking()Z
    .locals 4

    .line 28
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarInfoManager;->get()Lcom/yftech/vehicle/sdk/CarInfoManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarInfoManager;->getGearPosition()Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    move-result-object v0

    iput-object v0, p0, Lcom/yftech/upgrade/manager/CarStateManager;->mGearPosition:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    .line 29
    invoke-static {}, Lcom/yftech/vehicle/sdk/CarInfoManager;->get()Lcom/yftech/vehicle/sdk/CarInfoManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yftech/vehicle/sdk/CarInfoManager;->getVehicleSpeed()I

    move-result v0

    .line 30
    iget-object v1, p0, Lcom/yftech/upgrade/manager/CarStateManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isPark, mGearPosition: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/yftech/upgrade/manager/CarStateManager;->mGearPosition:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ",speed:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    iget-object v1, p0, Lcom/yftech/upgrade/manager/CarStateManager;->mGearPosition:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    if-eqz v1, :cond_0

    sget-object v2, Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;->PARKING:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/yftech/upgrade/manager/CarStateManager;->mGearPosition:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    sget-object v2, Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;->__UNKNOWN__:Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;

    if-ne v1, v2, :cond_1

    :cond_0
    if-gtz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method
