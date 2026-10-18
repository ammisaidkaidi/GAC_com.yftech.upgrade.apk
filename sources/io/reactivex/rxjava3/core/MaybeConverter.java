package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface MaybeConverter<T, R> {
    R apply(Maybe<T> upstream);
}
