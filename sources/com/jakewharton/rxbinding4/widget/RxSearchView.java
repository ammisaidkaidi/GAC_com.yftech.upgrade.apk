package com.jakewharton.rxbinding4.widget;

import android.widget.SearchView;
import com.jakewharton.rxbinding4.InitialValueObservable;
import io.reactivex.rxjava3.functions.Consumer;
import kotlin.Metadata;

@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxSearchView__SearchViewQueryConsumerKt", "com/jakewharton/rxbinding4/widget/RxSearchView__SearchViewQueryTextChangeEventsObservableKt", "com/jakewharton/rxbinding4/widget/RxSearchView__SearchViewQueryTextChangesObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxSearchView {
    public static final Consumer<? super CharSequence> query(SearchView searchView, boolean z) {
        return RxSearchView__SearchViewQueryConsumerKt.query(searchView, z);
    }

    public static final InitialValueObservable<SearchViewQueryTextEvent> queryTextChangeEvents(SearchView searchView) {
        return RxSearchView__SearchViewQueryTextChangeEventsObservableKt.queryTextChangeEvents(searchView);
    }

    public static final InitialValueObservable<CharSequence> queryTextChanges(SearchView searchView) {
        return RxSearchView__SearchViewQueryTextChangesObservableKt.queryTextChanges(searchView);
    }
}
