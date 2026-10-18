package com.yftech.upgrade.manager;

import android.util.Log;
import com.yftech.vehicle.internal.adapter.ICarInfo;
import com.yftech.vehicle.sdk.CarInfoManager;

/* loaded from: /home/user/work/dex/classes.dex */
public class CarStateManager {
    private static CarStateManager mInstance;
    private String TAG = "CarStateManager";
    private CarInfoManager.CarInfoListener mCarInfoListener = new CarInfoManager.CarInfoListener() { // from class: com.yftech.upgrade.manager.CarStateManager.1
        public void onGearPositionChanged(ICarInfo.GearPosition gearPosition) {
            super.onGearPositionChanged(gearPosition);
            CarStateManager.this.updateGearPosition(gearPosition);
        }

        public void onVehicleSpeedChanged(int i) {
            super.onVehicleSpeedChanged(i);
        }
    };
    ICarInfo.GearPosition mGearPosition;

    public static CarStateManager getInstance() {
        if (mInstance == null) {
            mInstance = new CarStateManager();
        }
        return mInstance;
    }

    public boolean isParking() {
        this.mGearPosition = CarInfoManager.get().getGearPosition();
        int vehicleSpeed = CarInfoManager.get().getVehicleSpeed();
        Log.i(this.TAG, "isPark, mGearPosition: " + this.mGearPosition + ",speed:" + vehicleSpeed);
        ICarInfo.GearPosition gearPosition = this.mGearPosition;
        return (gearPosition == null || gearPosition == ICarInfo.GearPosition.PARKING || this.mGearPosition == ICarInfo.GearPosition.__UNKNOWN__) && vehicleSpeed <= 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateGearPosition(ICarInfo.GearPosition gearPosition) {
        this.mGearPosition = gearPosition;
    }
}
