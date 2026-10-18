package com.jakewharton.rxbinding4.widget;

import android.widget.SeekBar;
import com.jakewharton.rxbinding4.InitialValueObservable;
import kotlin.Metadata;

@Metadata(bv = {1, 0, 3}, d1 = {"com/jakewharton/rxbinding4/widget/RxSeekBar__SeekBarChangeEventObservableKt", "com/jakewharton/rxbinding4/widget/RxSeekBar__SeekBarChangeObservableKt"}, k = 4, mv = {1, 1, 16})
/* loaded from: /home/user/work/dex/classes.dex */
public final class RxSeekBar {
    public static final InitialValueObservable<SeekBarChangeEvent> changeEvents(SeekBar seekBar) {
        return RxSeekBar__SeekBarChangeEventObservableKt.changeEvents(seekBar);
    }

    public static final InitialValueObservable<Integer> changes(SeekBar seekBar) {
        return RxSeekBar__SeekBarChangeObservableKt.changes(seekBar);
    }

    public static final InitialValueObservable<Integer> systemChanges(SeekBar seekBar) {
        return RxSeekBar__SeekBarChangeObservableKt.systemChanges(seekBar);
    }

    public static final InitialValueObservable<Integer> userChanges(SeekBar seekBar) {
        return RxSeekBar__SeekBarChangeObservableKt.userChanges(seekBar);
    }
}
