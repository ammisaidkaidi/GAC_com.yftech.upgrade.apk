package com.jakewharton.rxbinding4.widget;

import android.widget.AbsListView;
import io.reactivex.rxjava3.core.Observable;
import kotlin.Metadata;

/* compiled from: AbsListViewScrollEventObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxAbsListView__AbsListViewScrollEventObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxAbsListView {
    public static final Observable<AbsListViewScrollEvent> scrollEvents(AbsListView absListView) {
        return RxAbsListView__AbsListViewScrollEventObservableKt.scrollEvents(absListView);
    }
}
