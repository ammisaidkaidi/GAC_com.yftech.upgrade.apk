package com.jakewharton.rxbinding4.widget;

import android.view.MenuItem;
import android.widget.PopupMenu;
import io.reactivex.rxjava3.core.Observable;
import kotlin.Metadata;
import kotlin.Unit;

@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxPopupMenu__PopupMenuDismissObservableKt", "com/jakewharton/rxbinding4/widget/RxPopupMenu__PopupMenuItemClickObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxPopupMenu {
    public static final Observable<Unit> dismisses(PopupMenu popupMenu) {
        return RxPopupMenu__PopupMenuDismissObservableKt.dismisses(popupMenu);
    }

    public static final Observable<MenuItem> itemClicks(PopupMenu popupMenu) {
        return RxPopupMenu__PopupMenuItemClickObservableKt.itemClicks(popupMenu);
    }
}
