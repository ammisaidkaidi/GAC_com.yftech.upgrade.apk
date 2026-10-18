.class Lcom/yftech/upgrade/manager/CarStateManager$1;
.super Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;
.source "CarStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/manager/CarStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yftech/upgrade/manager/CarStateManager;


# direct methods
.method constructor <init>(Lcom/yftech/upgrade/manager/CarStateManager;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/yftech/upgrade/manager/CarStateManager$1;->this$0:Lcom/yftech/upgrade/manager/CarStateManager;

    invoke-direct {p0}, Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onGearPositionChanged(Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;)V
    .locals 1

    .line 44
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;->onGearPositionChanged(Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;)V

    .line 45
    iget-object v0, p0, Lcom/yftech/upgrade/manager/CarStateManager$1;->this$0:Lcom/yftech/upgrade/manager/CarStateManager;

    invoke-static {v0, p1}, Lcom/yftech/upgrade/manager/CarStateManager;->access$000(Lcom/yftech/upgrade/manager/CarStateManager;Lcom/yftech/vehicle/internal/adapter/ICarInfo$GearPosition;)V

    return-void
.end method

.method public onVehicleSpeedChanged(I)V
    .locals 0

    .line 50
    invoke-super {p0, p1}, Lcom/yftech/vehicle/sdk/CarInfoManager$CarInfoListener;->onVehicleSpeedChanged(I)V

    return-void
.end method
