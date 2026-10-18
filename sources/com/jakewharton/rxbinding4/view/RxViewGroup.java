package com.jakewharton.rxbinding4.view;

import android.view.ViewGroup;
import io.reactivex.rxjava3.core.Observable;
import kotlin.Metadata;

/* compiled from: ViewGroupHierarchyChangeEventObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/view/RxViewGroup__ViewGroupHierarchyChangeEventObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxViewGroup {
    public static final Observable<ViewGroupHierarchyChangeEvent> changeEvents(ViewGroup viewGroup) {
        return RxViewGroup__ViewGroupHierarchyChangeEventObservableKt.changeEvents(viewGroup);
    }
}
