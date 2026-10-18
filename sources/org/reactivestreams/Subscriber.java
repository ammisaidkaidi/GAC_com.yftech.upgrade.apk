package org.reactivestreams;

/* loaded from: /home/user/work/dex/classes.dex */
public interface Subscriber<T> {
    void onComplete();

    void onError(Throwable th);

    void onNext(T t);

    void onSubscribe(Subscription subscription);
}
