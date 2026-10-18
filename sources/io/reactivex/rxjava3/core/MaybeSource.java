package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface MaybeSource<T> {
    void subscribe(MaybeObserver<? super T> observer);
}
