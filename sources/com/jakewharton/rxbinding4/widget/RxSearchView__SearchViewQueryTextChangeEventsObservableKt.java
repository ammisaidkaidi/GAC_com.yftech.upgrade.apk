package com.jakewharton.rxbinding4.widget;

import android.widget.SearchView;
import com.jakewharton.rxbinding4.InitialValueObservable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: SearchViewQueryTextChangeEventsObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007¨\u0006\u0004"}, d2 = {"queryTextChangeEvents", "Lcom/jakewharton/rxbinding4/InitialValueObservable;", "Lcom/jakewharton/rxbinding4/widget/SearchViewQueryTextEvent;", "Landroid/widget/SearchView;", "rxbinding_release"}, k = 5, mv = {1, 1, 16}, xs = "com/jakewharton/rxbinding4/widget/RxSearchView")
/* loaded from: /home/user/work/dex/classes.dex */
final /* synthetic */ class RxSearchView__SearchViewQueryTextChangeEventsObservableKt {
    public static final InitialValueObservable<SearchViewQueryTextEvent> queryTextChangeEvents(SearchView queryTextChangeEvents) {
        Intrinsics.checkParameterIsNotNull(queryTextChangeEvents, "$this$queryTextChangeEvents");
        return new SearchViewQueryTextChangeEventsObservable(queryTextChangeEvents);
    }
}
