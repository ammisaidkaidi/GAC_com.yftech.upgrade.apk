package com.jakewharton.rxbinding4.widget;

import android.view.View;
import android.widget.AdapterView;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: AdapterViewSelectionEvent.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\n\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\r\u0010\u0013\u001a\u0006\u0012\u0002\b\u00030\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0016\u001a\u00020\tHÆ\u0003J7\u0010\u0017\u001a\u00020\u00002\f\b\u0002\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u001bHÖ\u0003J\t\u0010\u001c\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0018\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u001f"}, d2 = {"Lcom/jakewharton/rxbinding4/widget/AdapterViewItemSelectionEvent;", "Lcom/jakewharton/rxbinding4/widget/AdapterViewSelectionEvent;", "view", "Landroid/widget/AdapterView;", "selectedView", "Landroid/view/View;", "position", "", "id", "", "(Landroid/widget/AdapterView;Landroid/view/View;IJ)V", "getId", "()J", "getPosition", "()I", "getSelectedView", "()Landroid/view/View;", "getView", "()Landroid/widget/AdapterView;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "", "hashCode", "toString", "", "rxbinding_release"}, k = 1, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final /* data */ class AdapterViewItemSelectionEvent extends AdapterViewSelectionEvent {
    private final long id;
    private final int position;
    private final View selectedView;
    private final AdapterView<?> view;

    public static /* synthetic */ AdapterViewItemSelectionEvent copy$default(AdapterViewItemSelectionEvent adapterViewItemSelectionEvent, AdapterView adapterView, View view, int i, long j, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            adapterView = adapterViewItemSelectionEvent.getView();
        }
        if ((i2 & 2) != 0) {
            view = adapterViewItemSelectionEvent.selectedView;
        }
        View view2 = view;
        if ((i2 & 4) != 0) {
            i = adapterViewItemSelectionEvent.position;
        }
        int i3 = i;
        if ((i2 & 8) != 0) {
            j = adapterViewItemSelectionEvent.id;
        }
        return adapterViewItemSelectionEvent.copy(adapterView, view2, i3, j);
    }

    public final AdapterView<?> component1() {
        return getView();
    }

    /* renamed from: component2, reason: from getter */
    public final View getSelectedView() {
        return this.selectedView;
    }

    /* renamed from: component3, reason: from getter */
    public final int getPosition() {
        return this.position;
    }

    /* renamed from: component4, reason: from getter */
    public final long getId() {
        return this.id;
    }

    public final AdapterViewItemSelectionEvent copy(AdapterView<?> view, View selectedView, int position, long id) {
        Intrinsics.checkParameterIsNotNull(view, "view");
        return new AdapterViewItemSelectionEvent(view, selectedView, position, id);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AdapterViewItemSelectionEvent)) {
            return false;
        }
        AdapterViewItemSelectionEvent adapterViewItemSelectionEvent = (AdapterViewItemSelectionEvent) other;
        return Intrinsics.areEqual(getView(), adapterViewItemSelectionEvent.getView()) && Intrinsics.areEqual(this.selectedView, adapterViewItemSelectionEvent.selectedView) && this.position == adapterViewItemSelectionEvent.position && this.id == adapterViewItemSelectionEvent.id;
    }

    public int hashCode() {
        AdapterView<?> view = getView();
        int hashCode = (view != null ? view.hashCode() : 0) * 31;
        View view2 = this.selectedView;
        return ((((hashCode + (view2 != null ? view2.hashCode() : 0)) * 31) + Integer.hashCode(this.position)) * 31) + Long.hashCode(this.id);
    }

    public String toString() {
        return "AdapterViewItemSelectionEvent(view=" + getView() + ", selectedView=" + this.selectedView + ", position=" + this.position + ", id=" + this.id + ")";
    }

    @Override // com.jakewharton.rxbinding4.widget.AdapterViewSelectionEvent
    public AdapterView<?> getView() {
        return this.view;
    }

    public final View getSelectedView() {
        return this.selectedView;
    }

    public final int getPosition() {
        return this.position;
    }

    public final long getId() {
        return this.id;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AdapterViewItemSelectionEvent(AdapterView<?> view, View view2, int i, long j) {
        super(null);
        Intrinsics.checkParameterIsNotNull(view, "view");
        this.view = view;
        this.selectedView = view2;
        this.position = i;
        this.id = j;
    }
}
