package com.jakewharton.rxbinding4.widget;

import android.widget.Adapter;
import com.jakewharton.rxbinding4.InitialValueObservable;
import kotlin.Metadata;

/* compiled from: AdapterDataChangeObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxAdapter__AdapterDataChangeObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxAdapter {
    public static final <T extends Adapter> InitialValueObservable<T> dataChanges(T t) {
        return RxAdapter__AdapterDataChangeObservableKt.dataChanges(t);
    }
}
