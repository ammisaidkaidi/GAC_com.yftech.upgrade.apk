package com.jakewharton.rxbinding4.widget;

import android.widget.SeekBar;
import androidx.core.app.NotificationCompat;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: SeekBarChangeEvent.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0007HÆ\u0003J'\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00072\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u0019"}, d2 = {"Lcom/jakewharton/rxbinding4/widget/SeekBarProgressChangeEvent;", "Lcom/jakewharton/rxbinding4/widget/SeekBarChangeEvent;", "view", "Landroid/widget/SeekBar;", NotificationCompat.CATEGORY_PROGRESS, "", "fromUser", "", "(Landroid/widget/SeekBar;IZ)V", "getFromUser", "()Z", "getProgress", "()I", "getView", "()Landroid/widget/SeekBar;", "component1", "component2", "component3", "copy", "equals", "other", "", "hashCode", "toString", "", "rxbinding_release"}, k = 1, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final /* data */ class SeekBarProgressChangeEvent extends SeekBarChangeEvent {
    private final boolean fromUser;
    private final int progress;
    private final SeekBar view;

    public static /* synthetic */ SeekBarProgressChangeEvent copy$default(SeekBarProgressChangeEvent seekBarProgressChangeEvent, SeekBar seekBar, int i, boolean z, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            seekBar = seekBarProgressChangeEvent.getView();
        }
        if ((i2 & 2) != 0) {
            i = seekBarProgressChangeEvent.progress;
        }
        if ((i2 & 4) != 0) {
            z = seekBarProgressChangeEvent.fromUser;
        }
        return seekBarProgressChangeEvent.copy(seekBar, i, z);
    }

    public final SeekBar component1() {
        return getView();
    }

    /* renamed from: component2, reason: from getter */
    public final int getProgress() {
        return this.progress;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getFromUser() {
        return this.fromUser;
    }

    public final SeekBarProgressChangeEvent copy(SeekBar view, int progress, boolean fromUser) {
        Intrinsics.checkParameterIsNotNull(view, "view");
        return new SeekBarProgressChangeEvent(view, progress, fromUser);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SeekBarProgressChangeEvent)) {
            return false;
        }
        SeekBarProgressChangeEvent seekBarProgressChangeEvent = (SeekBarProgressChangeEvent) other;
        return Intrinsics.areEqual(getView(), seekBarProgressChangeEvent.getView()) && this.progress == seekBarProgressChangeEvent.progress && this.fromUser == seekBarProgressChangeEvent.fromUser;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int hashCode() {
        SeekBar view = getView();
        int hashCode = (((view != null ? view.hashCode() : 0) * 31) + Integer.hashCode(this.progress)) * 31;
        boolean z = this.fromUser;
        int i = z;
        if (z != 0) {
            i = 1;
        }
        return hashCode + i;
    }

    public String toString() {
        return "SeekBarProgressChangeEvent(view=" + getView() + ", progress=" + this.progress + ", fromUser=" + this.fromUser + ")";
    }

    @Override // com.jakewharton.rxbinding4.widget.SeekBarChangeEvent
    public SeekBar getView() {
        return this.view;
    }

    public final int getProgress() {
        return this.progress;
    }

    public final boolean getFromUser() {
        return this.fromUser;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SeekBarProgressChangeEvent(SeekBar view, int i, boolean z) {
        super(null);
        Intrinsics.checkParameterIsNotNull(view, "view");
        this.view = view;
        this.progress = i;
        this.fromUser = z;
    }
}
