package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface CompletableConverter<R> {
    R apply(Completable upstream);
}
