package com.chad.library.adapter.base.diff;

import java.util.List;

/* loaded from: /home/user/work/dex/classes.dex */
public interface ListChangeListener<T> {
    void onCurrentListChanged(List<T> list, List<T> list2);
}
