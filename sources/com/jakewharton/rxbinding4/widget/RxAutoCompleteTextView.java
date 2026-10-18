package com.jakewharton.rxbinding4.widget;

import android.widget.AutoCompleteTextView;
import io.reactivex.rxjava3.core.Observable;
import kotlin.Metadata;

/* compiled from: AutoCompleteTextViewItemClickEventObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxAutoCompleteTextView__AutoCompleteTextViewItemClickEventObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxAutoCompleteTextView {
    public static final Observable<AdapterViewItemClickEvent> itemClickEvents(AutoCompleteTextView autoCompleteTextView) {
        return RxAutoCompleteTextView__AutoCompleteTextViewItemClickEventObservableKt.itemClickEvents(autoCompleteTextView);
    }
}
