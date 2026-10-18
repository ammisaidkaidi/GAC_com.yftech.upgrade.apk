package io.reactivex.rxjava3.internal.fuseable;

import org.reactivestreams.Publisher;

/* loaded from: /home/user/work/dex/classes.dex */
public interface HasUpstreamPublisher<T> {
    Publisher<T> source();
}
