package com.jakewharton.rxbinding4.widget;

import android.widget.RadioGroup;
import com.jakewharton.rxbinding4.InitialValueObservable;
import io.reactivex.rxjava3.functions.Consumer;
import kotlin.Metadata;

@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxRadioGroup__RadioGroupCheckedChangeObservableKt", "com/jakewharton/rxbinding4/widget/RxRadioGroup__RadioGroupToggleCheckedConsumerKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxRadioGroup {
    public static final Consumer<? super Integer> checked(RadioGroup radioGroup) {
        return RxRadioGroup__RadioGroupToggleCheckedConsumerKt.checked(radioGroup);
    }

    public static final InitialValueObservable<Integer> checkedChanges(RadioGroup radioGroup) {
        return RxRadioGroup__RadioGroupCheckedChangeObservableKt.checkedChanges(radioGroup);
    }
}
