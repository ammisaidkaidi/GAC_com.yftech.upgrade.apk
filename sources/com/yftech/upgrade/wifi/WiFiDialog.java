package com.yftech.upgrade.wifi;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.net.wifi.WifiConfiguration;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.upgrade.R;
import kotlin.text.Typography;

/* loaded from: /home/user/work/dex/classes.dex */
public class WiFiDialog extends Dialog {
    private boolean editAble;
    private View.OnClickListener mDialogClick;
    private WiFiDialogCallback mListener;
    private View rootView;
    private TextView tvPwd;
    private WiFiItem wifiItem;

    /* loaded from: /home/user/work/dex/classes.dex */
    public interface WiFiDialogCallback {
        void cancelSave(WiFiItem wiFiItem);

        void connect(WiFiItem wiFiItem);

        void disconnect(WiFiItem wiFiItem);
    }

    public WiFiDialog(Context context, WiFiDialogCallback wiFiDialogCallback, WiFiItem wiFiItem, boolean z) {
        super(context, R.style.dialog);
        this.mDialogClick = new View.OnClickListener() { // from class: com.yftech.upgrade.wifi.WiFiDialog.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (view.getId() != 2131296530 && view.getId() != 2131296328) {
                    if (WiFiDialog.this.mListener == null) {
                        return;
                    }
                    if (view.getId() == 2131296531) {
                        WiFiDialog.this.mListener.connect(WiFiDialog.this.wifiItem);
                    } else if (view.getId() == 2131296329) {
                        WiFiDialog.this.mListener.cancelSave(WiFiDialog.this.wifiItem);
                    } else if (view.getId() == 2131296331) {
                        WiFiDialog.this.mListener.disconnect(WiFiDialog.this.wifiItem);
                    }
                    WiFiDialog.this.dismiss();
                    return;
                }
                WiFiDialog.this.dismiss();
            }
        };
        setEditAble(z);
        this.mListener = wiFiDialogCallback;
        this.wifiItem = wiFiItem;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.rootView = getLayoutInflater().inflate(R.layout.dialog_wifi, (ViewGroup) null);
        ((TextView) this.rootView.findViewById(R.id.wifi_dialog_ssid)).setText(this.wifiItem.getSsid());
        this.tvPwd = (TextView) this.rootView.findViewById(R.id.wifi_dialog_pwd);
        this.tvPwd.addTextChangedListener(new TextWatcher() { // from class: com.yftech.upgrade.wifi.WiFiDialog.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                WiFiDialog.this.enableSubmitIfAppropriate();
            }
        });
        this.rootView.findViewById(R.id.wifi_connect).setOnClickListener(this.mDialogClick);
        this.rootView.findViewById(R.id.wifi_cancel).setOnClickListener(this.mDialogClick);
        this.rootView.findViewById(R.id.btn_disconnect).setOnClickListener(this.mDialogClick);
        this.rootView.findViewById(R.id.btn_cancel_save).setOnClickListener(this.mDialogClick);
        this.rootView.findViewById(R.id.btn_cancel).setOnClickListener(this.mDialogClick);
        setContentView(this.rootView);
        getWindow().setLayout(-1, -1);
        setConnectEnabled(false);
        super.onCreate(bundle);
    }

    public void showConnectView(boolean z) {
        findViewById(R.id.linear_connect).setVisibility(z ? 0 : 8);
        findViewById(R.id.linear_prompt).setVisibility(z ? 8 : 0);
    }

    public boolean isEditAble() {
        return this.editAble;
    }

    public void setEditAble(boolean z) {
        this.editAble = z;
    }

    public int getWiFiSecurity(WiFiItem wiFiItem) {
        if (wiFiItem == null) {
            return 0;
        }
        return wiFiItem.getSecurity();
    }

    public void enableSubmitIfAppropriate() {
        if ((getWiFiSecurity(this.wifiItem) == 1 && this.tvPwd.length() == 0) || (getWiFiSecurity(this.wifiItem) == 2 && this.tvPwd.length() < 8)) {
            setConnectEnabled(false);
        } else {
            setConnectEnabled(true);
        }
    }

    public void setConnectEnabled(boolean z) {
        Button button = (Button) this.rootView.findViewById(R.id.wifi_connect);
        if (z) {
            button.setTextColor(-1);
            button.setEnabled(true);
        } else {
            button.setTextColor(Color.rgb(160, 160, 160));
            button.setEnabled(false);
        }
    }

    public WifiConfiguration getConfig() {
        WiFiItem wiFiItem = this.wifiItem;
        if (wiFiItem != null && wiFiItem.getNetworkId() != -1 && !isEditAble()) {
            return null;
        }
        WifiConfiguration wifiConfiguration = new WifiConfiguration();
        WiFiItem wiFiItem2 = this.wifiItem;
        if (wiFiItem2 == null) {
            wifiConfiguration.SSID = WiFiItem.convertToQuotedString(wiFiItem2.getSsid());
            wifiConfiguration.hiddenSSID = true;
        } else if (wiFiItem2.getNetworkId() == -1) {
            wifiConfiguration.SSID = WiFiItem.convertToQuotedString(this.wifiItem.getSsid());
        } else {
            wifiConfiguration.networkId = this.wifiItem.getNetworkId();
        }
        int wiFiSecurity = getWiFiSecurity(this.wifiItem);
        if (wiFiSecurity == 0) {
            wifiConfiguration.allowedKeyManagement.set(0);
        } else if (wiFiSecurity == 1) {
            wifiConfiguration.allowedKeyManagement.set(0);
            wifiConfiguration.allowedAuthAlgorithms.set(0);
            wifiConfiguration.allowedAuthAlgorithms.set(1);
            if (this.tvPwd.length() != 0) {
                int length = this.tvPwd.length();
                String charSequence = this.tvPwd.getText().toString();
                if ((length == 10 || length == 26 || length == 58) && charSequence.matches("[0-9A-Fa-f]*")) {
                    wifiConfiguration.wepKeys[0] = charSequence;
                } else {
                    wifiConfiguration.wepKeys[0] = Typography.quote + charSequence + Typography.quote;
                }
            }
        } else if (wiFiSecurity == 2) {
            wifiConfiguration.allowedKeyManagement.set(1);
            if (this.tvPwd.length() != 0) {
                String charSequence2 = this.tvPwd.getText().toString();
                if (charSequence2.matches("[0-9A-Fa-f]{64}")) {
                    wifiConfiguration.preSharedKey = charSequence2;
                } else {
                    wifiConfiguration.preSharedKey = Typography.quote + charSequence2 + Typography.quote;
                }
            }
        } else {
            if (wiFiSecurity != 3) {
                return null;
            }
            wifiConfiguration.allowedKeyManagement.set(2);
            wifiConfiguration.allowedKeyManagement.set(3);
            this.tvPwd.length();
        }
        return wifiConfiguration;
    }
}
