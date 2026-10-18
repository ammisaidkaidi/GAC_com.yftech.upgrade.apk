package com.jakewharton.rxbinding4.internal;

import android.os.Looper;
import io.reactivex.rxjava3.core.Observer;
import io.reactivex.rxjava3.disposables.Disposable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: mainThread.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0014\u0010\u0000\u001a\u00020\u00012\n\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u0003H\u0007¨\u0006\u0004"}, d2 = {"checkMainThread", "", "observer", "Lio/reactivex/rxjava3/core/Observer;", "rxbinding_release"}, k = 2, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class Preconditions {
    public static final boolean checkMainThread(Observer<?> observer) {
        Intrinsics.checkParameterIsNotNull(observer, "observer");
        if (!(!Intrinsics.areEqual(Looper.myLooper(), Looper.getMainLooper()))) {
            return true;
        }
        observer.onSubscribe(Disposable.empty());
        StringBuilder sb = new StringBuilder();
        sb.append("Expected to be called on the main thread but was ");
        Thread currentThread = Thread.currentThread();
        Intrinsics.checkExpressionValueIsNotNull(currentThread, "Thread.currentThread()");
        sb.append(currentThread.getName());
        observer.onError(new IllegalStateException(sb.toString()));
        return false;
    }
}
