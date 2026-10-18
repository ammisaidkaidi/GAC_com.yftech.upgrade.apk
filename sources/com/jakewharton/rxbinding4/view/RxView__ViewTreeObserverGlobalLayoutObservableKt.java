package com.jakewharton.rxbinding4.view;

import android.view.View;
import io.reactivex.rxjava3.core.Observable;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: ViewTreeObserverGlobalLayoutObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007¨\u0006\u0004"}, d2 = {"globalLayouts", "Lio/reactivex/rxjava3/core/Observable;", "", "Landroid/view/View;", "rxbinding_release"}, k = 5, mv = {1, 1, 16}, xs = "com/jakewharton/rxbinding4/view/RxView")
/* loaded from: /home/user/work/dex/classes.dex */
final /* synthetic */ class RxView__ViewTreeObserverGlobalLayoutObservableKt {
    public static final Observable<Unit> globalLayouts(View globalLayouts) {
        Intrinsics.checkParameterIsNotNull(globalLayouts, "$this$globalLayouts");
        return new ViewTreeObserverGlobalLayoutObservable(globalLayouts);
    }
}
