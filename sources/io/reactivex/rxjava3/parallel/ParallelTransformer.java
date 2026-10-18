package io.reactivex.rxjava3.parallel;

@FunctionalInterface
/* loaded from: /home/user/work/dex/classes.dex */
public interface ParallelTransformer<Upstream, Downstream> {
    ParallelFlowable<Downstream> apply(ParallelFlowable<Upstream> upstream);
}
