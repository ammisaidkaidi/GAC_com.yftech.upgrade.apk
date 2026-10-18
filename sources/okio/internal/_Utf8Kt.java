package okio.internal;

import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.ByteCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import okio.Utf8;

/* compiled from: -Utf8.kt */
@Metadata(bv = {1, 0, 2}, d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u0012\n\u0002\u0010\u000e\n\u0002\b\u0002\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u001a\n\u0010\u0003\u001a\u00020\u0002*\u00020\u0001¨\u0006\u0004"}, d2 = {"commonAsUtf8ToByteArray", "", "", "commonToUtf8String", "jvm"}, k = 2, mv = {1, 1, 11})
/* loaded from: /home/user/work/dex/classes.dex */
public final class _Utf8Kt {
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0105, code lost:
    
        if (((r17[r5] & 192) == 128) == false) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x008d, code lost:
    
        if (((r17[r5] & 192) == 128) == false) goto L17;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final String commonToUtf8String(byte[] receiver) {
        int i;
        int i2;
        int i3;
        Intrinsics.checkParameterIsNotNull(receiver, "$receiver");
        char[] cArr = new char[receiver.length];
        int length = receiver.length;
        int i4 = 0;
        int i5 = 0;
        while (i4 < length) {
            byte b = receiver[i4];
            if (b >= 0) {
                i = i5 + 1;
                cArr[i5] = (char) b;
                i4++;
                while (i4 < length && receiver[i4] >= 0) {
                    cArr[i] = (char) receiver[i4];
                    i4++;
                    i++;
                }
            } else {
                if ((b >> 5) == -2) {
                    int i6 = i4 + 1;
                    if (length <= i6) {
                        i = i5 + 1;
                        cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                    } else {
                        byte b2 = receiver[i4];
                        byte b3 = receiver[i6];
                        if ((b3 & 192) == 128) {
                            int i7 = (b3 ^ ByteCompanionObject.MIN_VALUE) ^ (b2 << 6);
                            if (i7 < 128) {
                                i = i5 + 1;
                                cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                            } else {
                                i = i5 + 1;
                                cArr[i5] = (char) i7;
                            }
                            i2 = 2;
                        } else {
                            i = i5 + 1;
                            cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                        }
                    }
                    i2 = 1;
                } else {
                    int i8 = 3;
                    if ((b >> 4) == -2) {
                        int i9 = i4 + 2;
                        if (length <= i9) {
                            i = i5 + 1;
                            cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                            int i10 = i4 + 1;
                            if (length > i10) {
                            }
                            i2 = 1;
                        } else {
                            byte b4 = receiver[i4];
                            byte b5 = receiver[i4 + 1];
                            if ((b5 & 192) == 128) {
                                byte b6 = receiver[i9];
                                if ((b6 & 192) == 128) {
                                    int i11 = ((b6 ^ ByteCompanionObject.MIN_VALUE) ^ (b5 << 6)) ^ (b4 << 12);
                                    if (i11 < 2048) {
                                        i = i5 + 1;
                                        cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                                    } else if (55296 <= i11 && 57343 >= i11) {
                                        i = i5 + 1;
                                        cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                                    } else {
                                        i = i5 + 1;
                                        cArr[i5] = (char) i11;
                                    }
                                    i2 = 3;
                                } else {
                                    i = i5 + 1;
                                    cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                                    i2 = 2;
                                }
                            } else {
                                i = i5 + 1;
                                cArr[i5] = (char) Utf8.REPLACEMENT_CODE_POINT;
                                i2 = 1;
                            }
                        }
                    } else {
                        if ((b >> 3) == -2) {
                            int i12 = i4 + 3;
                            if (length <= i12) {
                                i3 = i5 + 1;
                                cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                int i13 = i4 + 1;
                                if (length > i13) {
                                    if ((receiver[i13] & 192) == 128) {
                                        int i14 = i4 + 2;
                                        if (length > i14) {
                                        }
                                        i8 = 2;
                                        i4 += i8;
                                    }
                                }
                                i8 = 1;
                                i4 += i8;
                            } else {
                                byte b7 = receiver[i4];
                                byte b8 = receiver[i4 + 1];
                                if ((b8 & 192) == 128) {
                                    byte b9 = receiver[i4 + 2];
                                    if ((b9 & 192) == 128) {
                                        byte b10 = receiver[i12];
                                        if ((b10 & 192) == 128) {
                                            int i15 = (((b10 ^ ByteCompanionObject.MIN_VALUE) ^ (b9 << 6)) ^ (b8 << 12)) ^ (b7 << 18);
                                            if (i15 > 1114111) {
                                                i3 = i5 + 1;
                                                cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                            } else if (55296 <= i15 && 57343 >= i15) {
                                                i3 = i5 + 1;
                                                cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                            } else if (i15 < 65536) {
                                                i3 = i5 + 1;
                                                cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                            } else if (i15 != 65533) {
                                                int i16 = i5 + 1;
                                                cArr[i5] = (char) ((i15 >>> 10) + Utf8.HIGH_SURROGATE_HEADER);
                                                char c = (char) ((i15 & 1023) + Utf8.LOG_SURROGATE_HEADER);
                                                i3 = i16 + 1;
                                                cArr[i16] = c;
                                            } else {
                                                i3 = i5 + 1;
                                                cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                            }
                                            i8 = 4;
                                        } else {
                                            i3 = i5 + 1;
                                            cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                        }
                                        i4 += i8;
                                    } else {
                                        i3 = i5 + 1;
                                        cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                        i8 = 2;
                                        i4 += i8;
                                    }
                                } else {
                                    i3 = i5 + 1;
                                    cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                                    i8 = 1;
                                    i4 += i8;
                                }
                            }
                        } else {
                            i3 = i5 + 1;
                            cArr[i5] = Utf8.REPLACEMENT_CHARACTER;
                            i4++;
                        }
                        i5 = i3;
                    }
                }
                i4 += i2;
            }
            i5 = i;
        }
        return new String(cArr, 0, i5);
    }

    public static final byte[] commonAsUtf8ToByteArray(String receiver) {
        int i;
        int i2;
        char charAt;
        Intrinsics.checkParameterIsNotNull(receiver, "$receiver");
        byte[] bArr = new byte[receiver.length() * 4];
        int length = receiver.length();
        int i3 = 0;
        while (i3 < length) {
            char charAt2 = receiver.charAt(i3);
            if (charAt2 >= 128) {
                int length2 = receiver.length();
                int i4 = i3;
                while (i3 < length2) {
                    char charAt3 = receiver.charAt(i3);
                    if (charAt3 < 128) {
                        int i5 = i4 + 1;
                        bArr[i4] = (byte) charAt3;
                        i3++;
                        while (i3 < length2 && receiver.charAt(i3) < 128) {
                            bArr[i5] = (byte) receiver.charAt(i3);
                            i3++;
                            i5++;
                        }
                        i4 = i5;
                    } else {
                        if (charAt3 < 2048) {
                            int i6 = i4 + 1;
                            bArr[i4] = (byte) ((charAt3 >> 6) | 192);
                            byte b = (byte) ((charAt3 & '?') | 128);
                            i = i6 + 1;
                            bArr[i6] = b;
                        } else if (55296 > charAt3 || 57343 < charAt3) {
                            int i7 = i4 + 1;
                            bArr[i4] = (byte) ((charAt3 >> '\f') | 224);
                            int i8 = i7 + 1;
                            bArr[i7] = (byte) (((charAt3 >> 6) & 63) | 128);
                            byte b2 = (byte) ((charAt3 & '?') | 128);
                            i = i8 + 1;
                            bArr[i8] = b2;
                        } else if (charAt3 > 56319 || length2 <= (i2 = i3 + 1) || 56320 > (charAt = receiver.charAt(i2)) || 57343 < charAt) {
                            i = i4 + 1;
                            bArr[i4] = Utf8.REPLACEMENT_BYTE;
                        } else {
                            int charAt4 = ((charAt3 << '\n') + receiver.charAt(i2)) - 56613888;
                            int i9 = i4 + 1;
                            bArr[i4] = (byte) ((charAt4 >> 18) | 240);
                            int i10 = i9 + 1;
                            bArr[i9] = (byte) (((charAt4 >> 12) & 63) | 128);
                            int i11 = i10 + 1;
                            bArr[i10] = (byte) (((charAt4 >> 6) & 63) | 128);
                            byte b3 = (byte) ((charAt4 & 63) | 128);
                            i = i11 + 1;
                            bArr[i11] = b3;
                            i3 += 2;
                            i4 = i;
                        }
                        i3++;
                        i4 = i;
                    }
                }
                byte[] copyOf = Arrays.copyOf(bArr, i4);
                Intrinsics.checkExpressionValueIsNotNull(copyOf, "java.util.Arrays.copyOf(this, newSize)");
                return copyOf;
            }
            bArr[i3] = (byte) charAt2;
            i3++;
        }
        byte[] copyOf2 = Arrays.copyOf(bArr, receiver.length());
        Intrinsics.checkExpressionValueIsNotNull(copyOf2, "java.util.Arrays.copyOf(this, newSize)");
        return copyOf2;
    }
}
