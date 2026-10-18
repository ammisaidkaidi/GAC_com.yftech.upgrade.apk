package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface SingleSource<T> {
    void subscribe(SingleObserver<? super T> observer);
}
