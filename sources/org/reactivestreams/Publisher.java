package org.reactivestreams;

/* loaded from: /home/user/work/dex/classes.dex */
public interface Publisher<T> {
    void subscribe(Subscriber<? super T> subscriber);
}
