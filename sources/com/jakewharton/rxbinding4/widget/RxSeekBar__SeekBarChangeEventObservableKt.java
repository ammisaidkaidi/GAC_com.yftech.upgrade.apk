package com.jakewharton.rxbinding4.widget;

import android.widget.SeekBar;
import com.jakewharton.rxbinding4.InitialValueObservable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: SeekBarChangeEventObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007¨\u0006\u0004"}, d2 = {"changeEvents", "Lcom/jakewharton/rxbinding4/InitialValueObservable;", "Lcom/jakewharton/rxbinding4/widget/SeekBarChangeEvent;", "Landroid/widget/SeekBar;", "rxbinding_release"}, k = 5, mv = {1, 1, 16}, xs = "com/jakewharton/rxbinding4/widget/RxSeekBar")
/* loaded from: /home/user/work/dex/classes.dex */
final /* synthetic */ class RxSeekBar__SeekBarChangeEventObservableKt {
    public static final InitialValueObservable<SeekBarChangeEvent> changeEvents(SeekBar changeEvents) {
        Intrinsics.checkParameterIsNotNull(changeEvents, "$this$changeEvents");
        return new SeekBarChangeEventObservable(changeEvents);
    }
}
