package kotlin.collections;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
import kotlin.sequences.SequenceScope;

/* JADX INFO: Access modifiers changed from: package-private */
/* JADX INFO: Add missing generic type declarations: [T] */
/* compiled from: SlidingWindow.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00020\u00040\u0003H\u008a@¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"<anonymous>", "", "T", "Lkotlin/sequences/SequenceScope;", "", "invoke", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"}, k = 3, mv = {1, 1, 16})
@DebugMetadata(c = "kotlin.collections.SlidingWindowKt$windowedIterator$1", f = "SlidingWindow.kt", i = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4}, l = {34, 40, 49, 55, 58}, m = "invokeSuspend", n = {"$this$iterator", "bufferInitialCapacity", "gap", "buffer", "skip", "e", "$this$iterator", "bufferInitialCapacity", "gap", "buffer", "skip", "$this$iterator", "bufferInitialCapacity", "gap", "buffer", "e", "$this$iterator", "bufferInitialCapacity", "gap", "buffer", "$this$iterator", "bufferInitialCapacity", "gap", "buffer"}, s = {"L$0", "I$0", "I$1", "L$1", "I$2", "L$2", "L$0", "I$0", "I$1", "L$1", "I$2", "L$0", "I$0", "I$1", "L$1", "L$2", "L$0", "I$0", "I$1", "L$1", "L$0", "I$0", "I$1", "L$1"})
/* loaded from: /home/user/work/dex/classes.dex */
public final class SlidingWindowKt$windowedIterator$1<T> extends RestrictedSuspendLambda implements Function2<SequenceScope<? super List<? extends T>>, Continuation<? super Unit>, Object> {
    final /* synthetic */ Iterator $iterator;
    final /* synthetic */ boolean $partialWindows;
    final /* synthetic */ boolean $reuseBuffer;
    final /* synthetic */ int $size;
    final /* synthetic */ int $step;
    int I$0;
    int I$1;
    int I$2;
    Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    int label;
    private SequenceScope p$;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SlidingWindowKt$windowedIterator$1(int i, int i2, Iterator it, boolean z, boolean z2, Continuation continuation) {
        super(2, continuation);
        this.$size = i;
        this.$step = i2;
        this.$iterator = it;
        this.$reuseBuffer = z;
        this.$partialWindows = z2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> completion) {
        Intrinsics.checkParameterIsNotNull(completion, "completion");
        SlidingWindowKt$windowedIterator$1 slidingWindowKt$windowedIterator$1 = new SlidingWindowKt$windowedIterator$1(this.$size, this.$step, this.$iterator, this.$reuseBuffer, this.$partialWindows, completion);
        slidingWindowKt$windowedIterator$1.p$ = (SequenceScope) obj;
        return slidingWindowKt$windowedIterator$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Continuation<? super Unit> continuation) {
        return ((SlidingWindowKt$windowedIterator$1) create(obj, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x019c  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0109 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x00d8  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0193 -> B:16:0x0196). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x015a -> B:32:0x015d). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:64:0x00cd -> B:52:0x00d0). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        int i;
        SequenceScope sequenceScope;
        SlidingWindowKt$windowedIterator$1<T> slidingWindowKt$windowedIterator$1;
        int i2;
        Iterator it;
        ArrayList arrayList;
        int i3;
        Object obj2;
        int i4;
        SequenceScope sequenceScope2;
        SlidingWindowKt$windowedIterator$1<T> slidingWindowKt$windowedIterator$12;
        int i5;
        Iterator it2;
        RingBuffer ringBuffer;
        RingBuffer ringBuffer2;
        int i6;
        int i7;
        SequenceScope sequenceScope3;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        int i8 = this.label;
        if (i8 == 0) {
            ResultKt.throwOnFailure(obj);
            SequenceScope sequenceScope4 = this.p$;
            int coerceAtMost = RangesKt.coerceAtMost(this.$size, 1024);
            i = this.$step - this.$size;
            if (i >= 0) {
                arrayList = new ArrayList(coerceAtMost);
                i3 = 0;
                obj2 = coroutine_suspended;
                i4 = i;
                sequenceScope2 = sequenceScope4;
                slidingWindowKt$windowedIterator$12 = this;
                i5 = coerceAtMost;
                it2 = this.$iterator;
                while (it2.hasNext()) {
                }
                if (!arrayList.isEmpty()) {
                    slidingWindowKt$windowedIterator$12.L$0 = sequenceScope2;
                    slidingWindowKt$windowedIterator$12.I$0 = i5;
                    slidingWindowKt$windowedIterator$12.I$1 = i4;
                    slidingWindowKt$windowedIterator$12.L$1 = arrayList;
                    slidingWindowKt$windowedIterator$12.I$2 = i3;
                    slidingWindowKt$windowedIterator$12.label = 2;
                    if (sequenceScope2.yield(arrayList, slidingWindowKt$windowedIterator$12) == obj2) {
                    }
                }
                return Unit.INSTANCE;
            }
            RingBuffer ringBuffer3 = new RingBuffer(coerceAtMost);
            sequenceScope = sequenceScope4;
            slidingWindowKt$windowedIterator$1 = this;
            i2 = coerceAtMost;
            it = this.$iterator;
            ringBuffer = ringBuffer3;
            while (it.hasNext()) {
            }
            if (slidingWindowKt$windowedIterator$1.$partialWindows) {
            }
            return Unit.INSTANCE;
        }
        if (i8 == 1) {
            it2 = (Iterator) this.L$3;
            Object obj3 = this.L$2;
            int i9 = this.I$2;
            arrayList = (ArrayList) this.L$1;
            int i10 = this.I$1;
            i5 = this.I$0;
            sequenceScope2 = (SequenceScope) this.L$0;
            ResultKt.throwOnFailure(obj);
            slidingWindowKt$windowedIterator$12 = this;
            obj2 = coroutine_suspended;
            i4 = i10;
            if (slidingWindowKt$windowedIterator$12.$reuseBuffer) {
                arrayList = new ArrayList(slidingWindowKt$windowedIterator$12.$size);
            } else {
                arrayList.clear();
            }
            i3 = i4;
            while (it2.hasNext()) {
                Object next = it2.next();
                if (i3 > 0) {
                    i3--;
                } else {
                    arrayList.add(next);
                    if (arrayList.size() == slidingWindowKt$windowedIterator$12.$size) {
                        slidingWindowKt$windowedIterator$12.L$0 = sequenceScope2;
                        slidingWindowKt$windowedIterator$12.I$0 = i5;
                        slidingWindowKt$windowedIterator$12.I$1 = i4;
                        slidingWindowKt$windowedIterator$12.L$1 = arrayList;
                        slidingWindowKt$windowedIterator$12.I$2 = i3;
                        slidingWindowKt$windowedIterator$12.L$2 = next;
                        slidingWindowKt$windowedIterator$12.L$3 = it2;
                        slidingWindowKt$windowedIterator$12.label = 1;
                        if (sequenceScope2.yield(arrayList, slidingWindowKt$windowedIterator$12) == obj2) {
                            return obj2;
                        }
                        if (slidingWindowKt$windowedIterator$12.$reuseBuffer) {
                        }
                        i3 = i4;
                        while (it2.hasNext()) {
                        }
                    }
                }
            }
            if ((!arrayList.isEmpty()) && (slidingWindowKt$windowedIterator$12.$partialWindows || arrayList.size() == slidingWindowKt$windowedIterator$12.$size)) {
                slidingWindowKt$windowedIterator$12.L$0 = sequenceScope2;
                slidingWindowKt$windowedIterator$12.I$0 = i5;
                slidingWindowKt$windowedIterator$12.I$1 = i4;
                slidingWindowKt$windowedIterator$12.L$1 = arrayList;
                slidingWindowKt$windowedIterator$12.I$2 = i3;
                slidingWindowKt$windowedIterator$12.label = 2;
                if (sequenceScope2.yield(arrayList, slidingWindowKt$windowedIterator$12) == obj2) {
                    return obj2;
                }
            }
            return Unit.INSTANCE;
        }
        if (i8 == 2) {
            int i11 = this.I$2;
        } else {
            if (i8 == 3) {
                it = (Iterator) this.L$3;
                Object obj4 = this.L$2;
                RingBuffer ringBuffer4 = (RingBuffer) this.L$1;
                i = this.I$1;
                i2 = this.I$0;
                sequenceScope = (SequenceScope) this.L$0;
                ResultKt.throwOnFailure(obj);
                slidingWindowKt$windowedIterator$1 = this;
                RingBuffer ringBuffer5 = ringBuffer4;
                ringBuffer5.removeFirst(slidingWindowKt$windowedIterator$1.$step);
                ringBuffer = ringBuffer5;
                while (it.hasNext()) {
                    Object next2 = it.next();
                    ringBuffer.add((RingBuffer) next2);
                    if (ringBuffer.isFull()) {
                        int size = ringBuffer.size();
                        int i12 = slidingWindowKt$windowedIterator$1.$size;
                        if (size >= i12) {
                            List arrayList2 = slidingWindowKt$windowedIterator$1.$reuseBuffer ? ringBuffer : new ArrayList(ringBuffer);
                            slidingWindowKt$windowedIterator$1.L$0 = sequenceScope;
                            slidingWindowKt$windowedIterator$1.I$0 = i2;
                            slidingWindowKt$windowedIterator$1.I$1 = i;
                            slidingWindowKt$windowedIterator$1.L$1 = ringBuffer;
                            slidingWindowKt$windowedIterator$1.L$2 = next2;
                            slidingWindowKt$windowedIterator$1.L$3 = it;
                            slidingWindowKt$windowedIterator$1.label = 3;
                            ringBuffer5 = ringBuffer;
                            if (sequenceScope.yield(arrayList2, slidingWindowKt$windowedIterator$1) == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            ringBuffer5.removeFirst(slidingWindowKt$windowedIterator$1.$step);
                            ringBuffer = ringBuffer5;
                            while (it.hasNext()) {
                            }
                        } else {
                            ringBuffer = ringBuffer.expanded(i12);
                        }
                    }
                }
                if (slidingWindowKt$windowedIterator$1.$partialWindows) {
                    ringBuffer2 = ringBuffer;
                    i6 = i;
                    i7 = i2;
                    sequenceScope3 = sequenceScope;
                    if (ringBuffer2.size() <= slidingWindowKt$windowedIterator$1.$step) {
                    }
                }
                return Unit.INSTANCE;
            }
            if (i8 == 4) {
                ringBuffer2 = (RingBuffer) this.L$1;
                i6 = this.I$1;
                i7 = this.I$0;
                sequenceScope3 = (SequenceScope) this.L$0;
                ResultKt.throwOnFailure(obj);
                slidingWindowKt$windowedIterator$1 = this;
                ringBuffer2.removeFirst(slidingWindowKt$windowedIterator$1.$step);
                if (ringBuffer2.size() <= slidingWindowKt$windowedIterator$1.$step) {
                    List arrayList3 = slidingWindowKt$windowedIterator$1.$reuseBuffer ? ringBuffer2 : new ArrayList(ringBuffer2);
                    slidingWindowKt$windowedIterator$1.L$0 = sequenceScope3;
                    slidingWindowKt$windowedIterator$1.I$0 = i7;
                    slidingWindowKt$windowedIterator$1.I$1 = i6;
                    slidingWindowKt$windowedIterator$1.L$1 = ringBuffer2;
                    slidingWindowKt$windowedIterator$1.label = 4;
                    if (sequenceScope3.yield(arrayList3, slidingWindowKt$windowedIterator$1) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    ringBuffer2.removeFirst(slidingWindowKt$windowedIterator$1.$step);
                    if (ringBuffer2.size() <= slidingWindowKt$windowedIterator$1.$step) {
                        if (!ringBuffer2.isEmpty()) {
                            slidingWindowKt$windowedIterator$1.L$0 = sequenceScope3;
                            slidingWindowKt$windowedIterator$1.I$0 = i7;
                            slidingWindowKt$windowedIterator$1.I$1 = i6;
                            slidingWindowKt$windowedIterator$1.L$1 = ringBuffer2;
                            slidingWindowKt$windowedIterator$1.label = 5;
                            if (sequenceScope3.yield(ringBuffer2, slidingWindowKt$windowedIterator$1) == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                        }
                        return Unit.INSTANCE;
                    }
                }
            } else {
                if (i8 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            }
        }
        int i13 = this.I$1;
        int i14 = this.I$0;
        ResultKt.throwOnFailure(obj);
        return Unit.INSTANCE;
    }
}
