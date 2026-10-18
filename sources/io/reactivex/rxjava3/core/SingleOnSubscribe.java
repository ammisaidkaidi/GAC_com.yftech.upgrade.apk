package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface SingleOnSubscribe<T> {
    void subscribe(SingleEmitter<T> emitter) throws Throwable;
}
