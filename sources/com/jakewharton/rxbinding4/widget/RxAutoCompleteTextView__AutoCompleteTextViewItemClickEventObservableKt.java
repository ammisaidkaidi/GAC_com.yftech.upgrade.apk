package com.jakewharton.rxbinding4.widget;

import android.widget.AutoCompleteTextView;
import io.reactivex.rxjava3.core.Observable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: AutoCompleteTextViewItemClickEventObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007¨\u0006\u0004"}, d2 = {"itemClickEvents", "Lio/reactivex/rxjava3/core/Observable;", "Lcom/jakewharton/rxbinding4/widget/AdapterViewItemClickEvent;", "Landroid/widget/AutoCompleteTextView;", "rxbinding_release"}, k = 5, mv = {1, 1, 16}, xs = "com/jakewharton/rxbinding4/widget/RxAutoCompleteTextView")
/* loaded from: /home/user/work/dex/classes.dex */
final /* synthetic */ class RxAutoCompleteTextView__AutoCompleteTextViewItemClickEventObservableKt {
    public static final Observable<AdapterViewItemClickEvent> itemClickEvents(AutoCompleteTextView itemClickEvents) {
        Intrinsics.checkParameterIsNotNull(itemClickEvents, "$this$itemClickEvents");
        return new AutoCompleteTextViewItemClickEventObservable(itemClickEvents);
    }
}
