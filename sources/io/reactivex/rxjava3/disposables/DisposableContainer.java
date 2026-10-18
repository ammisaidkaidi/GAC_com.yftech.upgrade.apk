package io.reactivex.rxjava3.disposables;

/* loaded from: /home/user/work/dex/classes.dex */
public interface DisposableContainer {
    boolean add(Disposable d);

    boolean delete(Disposable d);

    boolean remove(Disposable d);
}
