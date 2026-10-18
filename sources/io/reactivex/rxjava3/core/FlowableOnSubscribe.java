package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface FlowableOnSubscribe<T> {
    void subscribe(FlowableEmitter<T> emitter) throws Throwable;
}
