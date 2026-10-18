package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface ObservableConverter<T, R> {
    R apply(Observable<T> upstream);
}
