package com.jakewharton.rxbinding4.widget;

import android.widget.RadioGroup;
import com.jakewharton.rxbinding4.InitialValueObservable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: RadioGroupCheckedChangeObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007¨\u0006\u0004"}, d2 = {"checkedChanges", "Lcom/jakewharton/rxbinding4/InitialValueObservable;", "", "Landroid/widget/RadioGroup;", "rxbinding_release"}, k = 5, mv = {1, 1, 16}, xs = "com/jakewharton/rxbinding4/widget/RxRadioGroup")
/* loaded from: /home/user/work/dex/classes.dex */
final /* synthetic */ class RxRadioGroup__RadioGroupCheckedChangeObservableKt {
    public static final InitialValueObservable<Integer> checkedChanges(RadioGroup checkedChanges) {
        Intrinsics.checkParameterIsNotNull(checkedChanges, "$this$checkedChanges");
        return new RadioGroupCheckedChangeObservable(checkedChanges);
    }
}
