package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface FlowableConverter<T, R> {
    R apply(Flowable<T> upstream);
}
