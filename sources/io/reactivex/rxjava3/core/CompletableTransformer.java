package io.reactivex.rxjava3.core;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface CompletableTransformer {
    CompletableSource apply(Completable upstream);
}
