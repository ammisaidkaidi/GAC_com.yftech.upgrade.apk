package com.jakewharton.rxbinding4.widget;

import android.widget.AbsListView;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: AbsListViewScrollEventObservable.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0005¢\u0006\u0002\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J;\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/jakewharton/rxbinding4/widget/AbsListViewScrollEvent;", "", "view", "Landroid/widget/AbsListView;", "scrollState", "", "firstVisibleItem", "visibleItemCount", "totalItemCount", "(Landroid/widget/AbsListView;IIII)V", "getFirstVisibleItem", "()I", "getScrollState", "getTotalItemCount", "getView", "()Landroid/widget/AbsListView;", "getVisibleItemCount", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "toString", "", "rxbinding_release"}, k = 1, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final /* data */ class AbsListViewScrollEvent {
    private final int firstVisibleItem;
    private final int scrollState;
    private final int totalItemCount;
    private final AbsListView view;
    private final int visibleItemCount;

    public static /* synthetic */ AbsListViewScrollEvent copy$default(AbsListViewScrollEvent absListViewScrollEvent, AbsListView absListView, int i, int i2, int i3, int i4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            absListView = absListViewScrollEvent.view;
        }
        if ((i5 & 2) != 0) {
            i = absListViewScrollEvent.scrollState;
        }
        int i6 = i;
        if ((i5 & 4) != 0) {
            i2 = absListViewScrollEvent.firstVisibleItem;
        }
        int i7 = i2;
        if ((i5 & 8) != 0) {
            i3 = absListViewScrollEvent.visibleItemCount;
        }
        int i8 = i3;
        if ((i5 & 16) != 0) {
            i4 = absListViewScrollEvent.totalItemCount;
        }
        return absListViewScrollEvent.copy(absListView, i6, i7, i8, i4);
    }

    /* renamed from: component1, reason: from getter */
    public final AbsListView getView() {
        return this.view;
    }

    /* renamed from: component2, reason: from getter */
    public final int getScrollState() {
        return this.scrollState;
    }

    /* renamed from: component3, reason: from getter */
    public final int getFirstVisibleItem() {
        return this.firstVisibleItem;
    }

    /* renamed from: component4, reason: from getter */
    public final int getVisibleItemCount() {
        return this.visibleItemCount;
    }

    /* renamed from: component5, reason: from getter */
    public final int getTotalItemCount() {
        return this.totalItemCount;
    }

    public final AbsListViewScrollEvent copy(AbsListView view, int scrollState, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        Intrinsics.checkParameterIsNotNull(view, "view");
        return new AbsListViewScrollEvent(view, scrollState, firstVisibleItem, visibleItemCount, totalItemCount);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AbsListViewScrollEvent)) {
            return false;
        }
        AbsListViewScrollEvent absListViewScrollEvent = (AbsListViewScrollEvent) other;
        return Intrinsics.areEqual(this.view, absListViewScrollEvent.view) && this.scrollState == absListViewScrollEvent.scrollState && this.firstVisibleItem == absListViewScrollEvent.firstVisibleItem && this.visibleItemCount == absListViewScrollEvent.visibleItemCount && this.totalItemCount == absListViewScrollEvent.totalItemCount;
    }

    public int hashCode() {
        AbsListView absListView = this.view;
        return ((((((((absListView != null ? absListView.hashCode() : 0) * 31) + Integer.hashCode(this.scrollState)) * 31) + Integer.hashCode(this.firstVisibleItem)) * 31) + Integer.hashCode(this.visibleItemCount)) * 31) + Integer.hashCode(this.totalItemCount);
    }

    public String toString() {
        return "AbsListViewScrollEvent(view=" + this.view + ", scrollState=" + this.scrollState + ", firstVisibleItem=" + this.firstVisibleItem + ", visibleItemCount=" + this.visibleItemCount + ", totalItemCount=" + this.totalItemCount + ")";
    }

    public AbsListViewScrollEvent(AbsListView view, int i, int i2, int i3, int i4) {
        Intrinsics.checkParameterIsNotNull(view, "view");
        this.view = view;
        this.scrollState = i;
        this.firstVisibleItem = i2;
        this.visibleItemCount = i3;
        this.totalItemCount = i4;
    }

    public final AbsListView getView() {
        return this.view;
    }

    public final int getScrollState() {
        return this.scrollState;
    }

    public final int getFirstVisibleItem() {
        return this.firstVisibleItem;
    }

    public final int getVisibleItemCount() {
        return this.visibleItemCount;
    }

    public final int getTotalItemCount() {
        return this.totalItemCount;
    }
}
