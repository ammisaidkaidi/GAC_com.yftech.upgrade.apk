package io.reactivex.rxjava3.core;

import org.reactivestreams.Subscriber;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface FlowableOperator<Downstream, Upstream> {
    Subscriber<? super Upstream> apply(Subscriber<? super Downstream> subscriber) throws Throwable;
}
