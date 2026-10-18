package okhttp3.internal.platform.android;

import android.util.Log;
import kotlin.Metadata;
import kotlin.TypeCastException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: util.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u0000\u001c\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0003\n\u0000\u001a\"\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"MAX_LOG_LENGTH", "", "androidLog", "", "level", "message", "", "t", "", "okhttp"}, k = 2, mv = {1, 1, 15})
/* loaded from: /home/user/work/dex/classes.dex */
public final class UtilKt {
    private static final int MAX_LOG_LENGTH = 4000;

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0055, code lost:
    
        r7 = r2 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void androidLog(int i, String message, Throwable th) {
        Intrinsics.checkParameterIsNotNull(message, "message");
        int i2 = i != 5 ? 3 : 5;
        if (th != null) {
            message = message + "\n" + Log.getStackTraceString(th);
        }
        int i3 = 0;
        int length = message.length();
        while (i3 < length) {
            int indexOf$default = StringsKt.indexOf$default((CharSequence) message, '\n', i3, false, 4, (Object) null);
            if (indexOf$default == -1) {
                indexOf$default = length;
            }
            while (true) {
                int min = Math.min(indexOf$default, i3 + MAX_LOG_LENGTH);
                if (message == null) {
                    throw new TypeCastException("null cannot be cast to non-null type java.lang.String");
                }
                String substring = message.substring(i3, min);
                Intrinsics.checkExpressionValueIsNotNull(substring, "(this as java.lang.Strin…ing(startIndex, endIndex)");
                Log.println(i2, "OkHttp", substring);
                if (min >= indexOf$default) {
                    break;
                } else {
                    i3 = min;
                }
            }
        }
    }
}
