package org.reactivestreams;

/* loaded from: /home/user/work/dex/classes.dex */
public interface Subscription {
    void cancel();

    void request(long j);
}
