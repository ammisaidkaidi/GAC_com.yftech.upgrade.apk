package com.jakewharton.rxbinding4.widget;

import android.widget.CompoundButton;
import com.jakewharton.rxbinding4.InitialValueObservable;
import kotlin.Metadata;

/* compiled from: CompoundButtonCheckedChangeObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxCompoundButton__CompoundButtonCheckedChangeObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxCompoundButton {
    public static final InitialValueObservable<Boolean> checkedChanges(CompoundButton compoundButton) {
        return RxCompoundButton__CompoundButtonCheckedChangeObservableKt.checkedChanges(compoundButton);
    }
}
