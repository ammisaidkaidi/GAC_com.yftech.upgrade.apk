package com.yftech.upgrade.app;

import android.app.Activity;
import android.os.Bundle;
import com.yftech.upgrade.R;
import com.yftech.upgrade.utils.Utils;

/* loaded from: /home/user/work/dex/classes.dex */
public class MainActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_main);
        Utils.startWiFiActivity(this);
        finish();
    }
}
