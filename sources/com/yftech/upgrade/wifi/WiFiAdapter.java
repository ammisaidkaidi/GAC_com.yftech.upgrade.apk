package com.yftech.upgrade.wifi;

import android.view.View;
import android.widget.ImageView;
import android.widget.SectionIndexer;
import android.widget.TextView;
import com.chad.library.adapter.base.BaseQuickAdapter;
import com.yftech.upgrade.R;

/* loaded from: /home/user/work/dex/classes.dex */
public class WiFiAdapter extends BaseQuickAdapter<WiFiItem, NormalViewHolder> implements SectionIndexer {
    private ItemClickListener mItemClickListener;

    /* loaded from: /home/user/work/dex/classes.dex */
    public interface ItemClickListener {
        void onItemClicked(WiFiItem wiFiItem);
    }

    @Override // android.widget.SectionIndexer
    public int getPositionForSection(int i) {
        return -1;
    }

    @Override // android.widget.SectionIndexer
    public int getSectionForPosition(int i) {
        return 0;
    }

    @Override // android.widget.SectionIndexer
    public Object[] getSections() {
        return new Object[0];
    }

    public WiFiAdapter() {
        super(R.layout.item_wifi_list);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.chad.library.adapter.base.BaseQuickAdapter
    public void convert(NormalViewHolder normalViewHolder, final WiFiItem wiFiItem) {
        ((TextView) normalViewHolder.getView(R.id.tv_name)).setText(wiFiItem.getSsid());
        ((TextView) normalViewHolder.getView(R.id.tv_msg)).setText(wiFiItem.getWifiItemMsg());
        ImageView imageView = (ImageView) normalViewHolder.getView(R.id.iv_signal);
        if (wiFiItem.getRssi() == Integer.MAX_VALUE) {
            imageView.setImageDrawable(null);
        } else {
            imageView.setImageLevel(wiFiItem.getLevel());
            imageView.setImageResource(R.drawable.wifi_signal_level);
            imageView.setImageState(wiFiItem.getSecurity() != 0 ? WiFiSecurity.STATE_SECURED : WiFiSecurity.STATE_NONE, true);
        }
        normalViewHolder.getView(R.id.linear).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.upgrade.wifi.WiFiAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (WiFiAdapter.this.mItemClickListener != null) {
                    WiFiAdapter.this.mItemClickListener.onItemClicked(wiFiItem);
                }
            }
        });
    }

    public void setItemClickListener(ItemClickListener itemClickListener) {
        this.mItemClickListener = itemClickListener;
    }
}
