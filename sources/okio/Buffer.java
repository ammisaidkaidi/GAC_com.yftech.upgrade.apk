package okio;

import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.util.Arrays;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.TypeCastException;
import kotlin.UByte;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.ByteCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.LongCompanionObject;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.Charsets;
import kotlin.text.Typography;

/* compiled from: Buffer.kt */
@Metadata(bv = {1, 0, 2}, d1 = {"\u0000¶\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u001a\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0005\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0012\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\n\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0018\u0018\u0000 \u009c\u00012\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0004\u009c\u0001\u009d\u0001B\u0005¢\u0006\u0002\u0010\u0005J\b\u0010\u0006\u001a\u00020\u0000H\u0016J\u0006\u0010\u0011\u001a\u00020\u0012J\b\u0010\u0013\u001a\u00020\u0000H\u0016J\b\u0010\u0014\u001a\u00020\u0012H\u0016J\u0006\u0010\u0015\u001a\u00020\fJ$\u0010\u0016\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00182\b\b\u0002\u0010\u0019\u001a\u00020\f2\b\b\u0002\u0010\u001a\u001a\u00020\fH\u0007J\"\u0010\u0016\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0019\u001a\u00020\f2\b\b\u0002\u0010\u001a\u001a\u00020\fJ\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J\b\u0010\u001f\u001a\u00020\u0000H\u0016J\b\u0010 \u001a\u00020\u0000H\u0016J\u0013\u0010!\u001a\u00020\"2\b\u0010#\u001a\u0004\u0018\u00010$H\u0096\u0002J\b\u0010%\u001a\u00020\"H\u0016J\b\u0010&\u001a\u00020\u0012H\u0016J\u0016\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020\fH\u0087\u0002¢\u0006\u0002\b*J\u0015\u0010*\u001a\u00020(2\u0006\u0010+\u001a\u00020\fH\u0007¢\u0006\u0002\b,J\b\u0010-\u001a\u00020.H\u0016J\u0018\u0010/\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u00100\u001a\u00020\u001cH\u0002J\u000e\u00101\u001a\u00020\u001c2\u0006\u00100\u001a\u00020\u001cJ\u000e\u00102\u001a\u00020\u001c2\u0006\u00100\u001a\u00020\u001cJ\u000e\u00103\u001a\u00020\u001c2\u0006\u00100\u001a\u00020\u001cJ\u0010\u00104\u001a\u00020\f2\u0006\u00105\u001a\u00020(H\u0016J\u0018\u00104\u001a\u00020\f2\u0006\u00105\u001a\u00020(2\u0006\u00106\u001a\u00020\fH\u0016J \u00104\u001a\u00020\f2\u0006\u00105\u001a\u00020(2\u0006\u00106\u001a\u00020\f2\u0006\u00107\u001a\u00020\fH\u0016J\u0010\u00104\u001a\u00020\f2\u0006\u00108\u001a\u00020\u001cH\u0016J\u0018\u00104\u001a\u00020\f2\u0006\u00108\u001a\u00020\u001c2\u0006\u00106\u001a\u00020\fH\u0016J\u0010\u00109\u001a\u00020\f2\u0006\u0010:\u001a\u00020\u001cH\u0016J\u0018\u00109\u001a\u00020\f2\u0006\u0010:\u001a\u00020\u001c2\u0006\u00106\u001a\u00020\fH\u0016J\b\u0010;\u001a\u00020<H\u0016J\b\u0010=\u001a\u00020\"H\u0016J\u0006\u0010>\u001a\u00020\u001cJ\b\u0010?\u001a\u00020\u0018H\u0016J\b\u0010@\u001a\u00020\u0001H\u0016J\u0018\u0010A\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\f2\u0006\u00108\u001a\u00020\u001cH\u0016J(\u0010A\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\f2\u0006\u00108\u001a\u00020\u001c2\u0006\u0010B\u001a\u00020.2\u0006\u0010\u001a\u001a\u00020.H\u0016J0\u0010A\u001a\u00020\"2\u0006\u0010C\u001a\u00020\n2\u0006\u0010D\u001a\u00020.2\u0006\u00108\u001a\u00020E2\u0006\u0010B\u001a\u00020.2\u0006\u0010F\u001a\u00020.H\u0002J\u0010\u0010G\u001a\u00020.2\u0006\u0010H\u001a\u00020IH\u0016J\u0010\u0010G\u001a\u00020.2\u0006\u0010H\u001a\u00020EH\u0016J \u0010G\u001a\u00020.2\u0006\u0010H\u001a\u00020E2\u0006\u0010\u0019\u001a\u00020.2\u0006\u0010\u001a\u001a\u00020.H\u0016J\u0018\u0010G\u001a\u00020\f2\u0006\u0010H\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\fH\u0016J\u0010\u0010J\u001a\u00020\f2\u0006\u0010H\u001a\u00020KH\u0016J\u0012\u0010L\u001a\u00020M2\b\b\u0002\u0010N\u001a\u00020MH\u0007J\b\u0010O\u001a\u00020(H\u0016J\b\u0010P\u001a\u00020EH\u0016J\u0010\u0010P\u001a\u00020E2\u0006\u0010\u001a\u001a\u00020\fH\u0016J\b\u0010Q\u001a\u00020\u001cH\u0016J\u0010\u0010Q\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\fH\u0016J\b\u0010R\u001a\u00020\fH\u0016J\u000e\u0010S\u001a\u00020\u00002\u0006\u0010T\u001a\u00020<J\u0016\u0010S\u001a\u00020\u00002\u0006\u0010T\u001a\u00020<2\u0006\u0010\u001a\u001a\u00020\fJ \u0010S\u001a\u00020\u00122\u0006\u0010T\u001a\u00020<2\u0006\u0010\u001a\u001a\u00020\f2\u0006\u0010U\u001a\u00020\"H\u0002J\u0010\u0010V\u001a\u00020\u00122\u0006\u0010H\u001a\u00020EH\u0016J\u0018\u0010V\u001a\u00020\u00122\u0006\u0010H\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\fH\u0016J\b\u0010W\u001a\u00020\fH\u0016J\b\u0010X\u001a\u00020.H\u0016J\b\u0010Y\u001a\u00020.H\u0016J\b\u0010Z\u001a\u00020\fH\u0016J\b\u0010[\u001a\u00020\fH\u0016J\b\u0010\\\u001a\u00020]H\u0016J\b\u0010^\u001a\u00020]H\u0016J\u0010\u0010_\u001a\u00020\u001e2\u0006\u0010`\u001a\u00020aH\u0016J\u0018\u0010_\u001a\u00020\u001e2\u0006\u0010\u001a\u001a\u00020\f2\u0006\u0010`\u001a\u00020aH\u0016J\u0012\u0010b\u001a\u00020M2\b\b\u0002\u0010N\u001a\u00020MH\u0007J\b\u0010c\u001a\u00020\u001eH\u0016J\u0010\u0010c\u001a\u00020\u001e2\u0006\u0010\u001a\u001a\u00020\fH\u0016J\b\u0010d\u001a\u00020.H\u0016J\n\u0010e\u001a\u0004\u0018\u00010\u001eH\u0016J\u0015\u0010e\u001a\u00020\u001e2\u0006\u0010f\u001a\u00020\fH\u0000¢\u0006\u0002\bgJ\b\u0010h\u001a\u00020\u001eH\u0016J\u0010\u0010h\u001a\u00020\u001e2\u0006\u0010i\u001a\u00020\fH\u0016J\u0010\u0010j\u001a\u00020\"2\u0006\u0010\u001a\u001a\u00020\fH\u0016J\u0010\u0010k\u001a\u00020\u00122\u0006\u0010\u001a\u001a\u00020\fH\u0016J8\u0010l\u001a\u0002Hm\"\u0004\b\u0000\u0010m2\u0006\u00106\u001a\u00020\f2\u001a\u0010n\u001a\u0016\u0012\u0006\u0012\u0004\u0018\u00010\n\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002Hm0oH\u0082\b¢\u0006\u0002\u0010pJ\u0010\u0010q\u001a\u00020.2\u0006\u0010r\u001a\u00020sH\u0016J\u001f\u0010t\u001a\u00020.2\u0006\u0010r\u001a\u00020s2\b\b\u0002\u0010u\u001a\u00020\"H\u0000¢\u0006\u0002\bvJ\u0006\u0010w\u001a\u00020\u001cJ\u0006\u0010x\u001a\u00020\u001cJ\u0006\u0010y\u001a\u00020\u001cJ\r\u0010\r\u001a\u00020\fH\u0007¢\u0006\u0002\bzJ\u0010\u0010{\u001a\u00020\u00122\u0006\u0010\u001a\u001a\u00020\fH\u0016J\u0006\u0010|\u001a\u00020\u001cJ\u000e\u0010|\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020.J\b\u0010}\u001a\u00020~H\u0016J\b\u0010\u007f\u001a\u00020\u001eH\u0016J\u0018\u0010\u0080\u0001\u001a\u00020\n2\u0007\u0010\u0081\u0001\u001a\u00020.H\u0000¢\u0006\u0003\b\u0082\u0001J\u0012\u0010\u0083\u0001\u001a\u00020.2\u0007\u0010\u0084\u0001\u001a\u00020IH\u0016J\u0012\u0010\u0083\u0001\u001a\u00020\u00002\u0007\u0010\u0084\u0001\u001a\u00020EH\u0016J\"\u0010\u0083\u0001\u001a\u00020\u00002\u0007\u0010\u0084\u0001\u001a\u00020E2\u0006\u0010\u0019\u001a\u00020.2\u0006\u0010\u001a\u001a\u00020.H\u0016J\u001a\u0010\u0083\u0001\u001a\u00020\u00122\u0007\u0010\u0084\u0001\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\fH\u0016J\u0012\u0010\u0083\u0001\u001a\u00020\u00002\u0007\u0010\u0085\u0001\u001a\u00020\u001cH\u0016J\u001b\u0010\u0083\u0001\u001a\u00020\u00022\b\u0010\u0084\u0001\u001a\u00030\u0086\u00012\u0006\u0010\u001a\u001a\u00020\fH\u0016J\u0013\u0010\u0087\u0001\u001a\u00020\f2\b\u0010\u0084\u0001\u001a\u00030\u0086\u0001H\u0016J\u0011\u0010\u0088\u0001\u001a\u00020\u00002\u0006\u00105\u001a\u00020.H\u0016J\u0012\u0010\u0089\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\fH\u0016J\u0012\u0010\u008b\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\fH\u0016J\u0012\u0010\u008c\u0001\u001a\u00020\u00002\u0007\u0010\u008d\u0001\u001a\u00020.H\u0016J\u0012\u0010\u008e\u0001\u001a\u00020\u00002\u0007\u0010\u008d\u0001\u001a\u00020.H\u0016J\u0012\u0010\u008f\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\fH\u0016J\u0012\u0010\u0090\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\fH\u0016J\u0012\u0010\u0091\u0001\u001a\u00020\u00002\u0007\u0010\u0092\u0001\u001a\u00020.H\u0016J\u0012\u0010\u0093\u0001\u001a\u00020\u00002\u0007\u0010\u0092\u0001\u001a\u00020.H\u0016J\u001a\u0010\u0094\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001e2\u0006\u0010`\u001a\u00020aH\u0016J,\u0010\u0094\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001e2\u0007\u0010\u0096\u0001\u001a\u00020.2\u0007\u0010\u0097\u0001\u001a\u00020.2\u0006\u0010`\u001a\u00020aH\u0016J\u001b\u0010\u0098\u0001\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00182\b\b\u0002\u0010\u001a\u001a\u00020\fH\u0007J\u0012\u0010\u0099\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001eH\u0016J$\u0010\u0099\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001e2\u0007\u0010\u0096\u0001\u001a\u00020.2\u0007\u0010\u0097\u0001\u001a\u00020.H\u0016J\u0012\u0010\u009a\u0001\u001a\u00020\u00002\u0007\u0010\u009b\u0001\u001a\u00020.H\u0016R\u0014\u0010\u0006\u001a\u00020\u00008VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\u0004\u0018\u00010\n8\u0000@\u0000X\u0081\u000e¢\u0006\u0002\n\u0000R&\u0010\r\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8\u0007@@X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010¨\u0006\u009e\u0001"}, d2 = {"Lokio/Buffer;", "Lokio/BufferedSource;", "Lokio/BufferedSink;", "", "Ljava/nio/channels/ByteChannel;", "()V", "buffer", "getBuffer", "()Lokio/Buffer;", "head", "Lokio/Segment;", "<set-?>", "", "size", "()J", "setSize$jvm", "(J)V", "clear", "", "clone", "close", "completeSegmentByteCount", "copyTo", "out", "Ljava/io/OutputStream;", "offset", "byteCount", "digest", "Lokio/ByteString;", "algorithm", "", "emit", "emitCompleteSegments", "equals", "", "other", "", "exhausted", "flush", "get", "", "pos", "getByte", "index", "-deprecated_getByte", "hashCode", "", "hmac", "key", "hmacSha1", "hmacSha256", "hmacSha512", "indexOf", "b", "fromIndex", "toIndex", "bytes", "indexOfElement", "targetBytes", "inputStream", "Ljava/io/InputStream;", "isOpen", "md5", "outputStream", "peek", "rangeEquals", "bytesOffset", "segment", "segmentPos", "", "bytesLimit", "read", "sink", "Ljava/nio/ByteBuffer;", "readAll", "Lokio/Sink;", "readAndWriteUnsafe", "Lokio/Buffer$UnsafeCursor;", "unsafeCursor", "readByte", "readByteArray", "readByteString", "readDecimalLong", "readFrom", "input", "forever", "readFully", "readHexadecimalUnsignedLong", "readInt", "readIntLe", "readLong", "readLongLe", "readShort", "", "readShortLe", "readString", "charset", "Ljava/nio/charset/Charset;", "readUnsafe", "readUtf8", "readUtf8CodePoint", "readUtf8Line", "newline", "readUtf8Line$jvm", "readUtf8LineStrict", "limit", "request", "require", "seek", "T", "lambda", "Lkotlin/Function2;", "(JLkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "select", "options", "Lokio/Options;", "selectPrefix", "selectTruncated", "selectPrefix$jvm", "sha1", "sha256", "sha512", "-deprecated_size", "skip", "snapshot", "timeout", "Lokio/Timeout;", "toString", "writableSegment", "minimumCapacity", "writableSegment$jvm", "write", "source", "byteString", "Lokio/Source;", "writeAll", "writeByte", "writeDecimalLong", "v", "writeHexadecimalUnsignedLong", "writeInt", "i", "writeIntLe", "writeLong", "writeLongLe", "writeShort", "s", "writeShortLe", "writeString", "string", "beginIndex", "endIndex", "writeTo", "writeUtf8", "writeUtf8CodePoint", "codePoint", "Companion", "UnsafeCursor", "jvm"}, k = 1, mv = {1, 1, 11})
/* loaded from: /home/user/work/dex/classes.dex */
public final class Buffer implements BufferedSource, BufferedSink, Cloneable, ByteChannel {
    private static final byte[] DIGITS;
    public Segment head;
    private long size;

    @Override // okio.BufferedSource, okio.BufferedSink
    /* renamed from: buffer */
    public Buffer getBufferField() {
        return this;
    }

    @Override // okio.Source, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }

    public final Buffer copyTo(OutputStream outputStream) throws IOException {
        return copyTo$default(this, outputStream, 0L, 0L, 6, (Object) null);
    }

    public final Buffer copyTo(OutputStream outputStream, long j) throws IOException {
        return copyTo$default(this, outputStream, j, 0L, 4, (Object) null);
    }

    @Override // okio.BufferedSink
    public Buffer emit() {
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer emitCompleteSegments() {
        return this;
    }

    @Override // okio.BufferedSink, okio.Sink, java.io.Flushable
    public void flush() {
    }

    @Override // okio.BufferedSource, okio.BufferedSink
    public Buffer getBuffer() {
        return this;
    }

    @Override // java.nio.channels.Channel
    public boolean isOpen() {
        return true;
    }

    public final UnsafeCursor readAndWriteUnsafe() {
        return readAndWriteUnsafe$default(this, null, 1, null);
    }

    public final UnsafeCursor readUnsafe() {
        return readUnsafe$default(this, null, 1, null);
    }

    public final Buffer writeTo(OutputStream outputStream) throws IOException {
        return writeTo$default(this, outputStream, 0L, 2, null);
    }

    public final void setSize$jvm(long j) {
        this.size = j;
    }

    public final long size() {
        return this.size;
    }

    @Override // okio.BufferedSink
    public OutputStream outputStream() {
        return new OutputStream() { // from class: okio.Buffer$outputStream$1
            @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
            public void close() {
            }

            @Override // java.io.OutputStream, java.io.Flushable
            public void flush() {
            }

            @Override // java.io.OutputStream
            public void write(int b) {
                Buffer.this.writeByte(b);
            }

            @Override // java.io.OutputStream
            public void write(byte[] data, int offset, int byteCount) {
                Intrinsics.checkParameterIsNotNull(data, "data");
                Buffer.this.write(data, offset, byteCount);
            }

            public String toString() {
                return Buffer.this + ".outputStream()";
            }
        };
    }

    @Override // okio.BufferedSource
    public boolean exhausted() {
        return this.size == 0;
    }

    @Override // okio.BufferedSource
    public void require(long byteCount) throws EOFException {
        if (this.size < byteCount) {
            throw new EOFException();
        }
    }

    @Override // okio.BufferedSource
    public boolean request(long byteCount) {
        return this.size >= byteCount;
    }

    @Override // okio.BufferedSource
    public BufferedSource peek() {
        return Okio.buffer(new PeekSource(this));
    }

    @Override // okio.BufferedSource
    public InputStream inputStream() {
        return new InputStream() { // from class: okio.Buffer$inputStream$1
            @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
            public void close() {
            }

            @Override // java.io.InputStream
            public int read() {
                if (Buffer.this.size() > 0) {
                    return Buffer.this.readByte() & UByte.MAX_VALUE;
                }
                return -1;
            }

            @Override // java.io.InputStream
            public int read(byte[] sink, int offset, int byteCount) {
                Intrinsics.checkParameterIsNotNull(sink, "sink");
                return Buffer.this.read(sink, offset, byteCount);
            }

            @Override // java.io.InputStream
            public int available() {
                return (int) Math.min(Buffer.this.size(), Integer.MAX_VALUE);
            }

            public String toString() {
                return Buffer.this + ".inputStream()";
            }
        };
    }

    public static /* bridge */ /* synthetic */ Buffer copyTo$default(Buffer buffer, OutputStream outputStream, long j, long j2, int i, Object obj) throws IOException {
        if ((i & 2) != 0) {
            j = 0;
        }
        long j3 = j;
        if ((i & 4) != 0) {
            j2 = buffer.size - j3;
        }
        return buffer.copyTo(outputStream, j3, j2);
    }

    public final Buffer copyTo(OutputStream out, long offset, long byteCount) throws IOException {
        Intrinsics.checkParameterIsNotNull(out, "out");
        Util.checkOffsetAndCount(this.size, offset, byteCount);
        if (byteCount == 0) {
            return this;
        }
        Segment segment = this.head;
        while (true) {
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            if (offset < segment.limit - segment.pos) {
                break;
            }
            offset -= segment.limit - segment.pos;
            segment = segment.next;
        }
        while (byteCount > 0) {
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            int min = (int) Math.min(segment.limit - r9, byteCount);
            out.write(segment.data, (int) (segment.pos + offset), min);
            byteCount -= min;
            segment = segment.next;
            offset = 0;
        }
        return this;
    }

    public static /* bridge */ /* synthetic */ Buffer copyTo$default(Buffer buffer, Buffer buffer2, long j, long j2, int i, Object obj) {
        if ((i & 2) != 0) {
            j = 0;
        }
        long j3 = j;
        if ((i & 4) != 0) {
            j2 = buffer.size - j3;
        }
        return buffer.copyTo(buffer2, j3, j2);
    }

    public final Buffer copyTo(Buffer out, long offset, long byteCount) {
        Intrinsics.checkParameterIsNotNull(out, "out");
        Util.checkOffsetAndCount(this.size, offset, byteCount);
        if (byteCount == 0) {
            return this;
        }
        out.size += byteCount;
        Segment segment = this.head;
        while (true) {
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            if (offset < segment.limit - segment.pos) {
                break;
            }
            offset -= segment.limit - segment.pos;
            segment = segment.next;
        }
        while (byteCount > 0) {
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            Segment sharedCopy = segment.sharedCopy();
            sharedCopy.pos += (int) offset;
            sharedCopy.limit = Math.min(sharedCopy.pos + ((int) byteCount), sharedCopy.limit);
            Segment segment2 = out.head;
            if (segment2 == null) {
                sharedCopy.prev = sharedCopy;
                sharedCopy.next = sharedCopy.prev;
                out.head = sharedCopy.next;
            } else {
                if (segment2 == null) {
                    Intrinsics.throwNpe();
                }
                Segment segment3 = segment2.prev;
                if (segment3 == null) {
                    Intrinsics.throwNpe();
                }
                segment3.push(sharedCopy);
            }
            byteCount -= sharedCopy.limit - sharedCopy.pos;
            segment = segment.next;
            offset = 0;
        }
        return this;
    }

    public static /* bridge */ /* synthetic */ Buffer writeTo$default(Buffer buffer, OutputStream outputStream, long j, int i, Object obj) throws IOException {
        if ((i & 2) != 0) {
            j = buffer.size;
        }
        return buffer.writeTo(outputStream, j);
    }

    public final Buffer writeTo(OutputStream out, long byteCount) throws IOException {
        Intrinsics.checkParameterIsNotNull(out, "out");
        Util.checkOffsetAndCount(this.size, 0L, byteCount);
        Segment segment = this.head;
        while (byteCount > 0) {
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            int min = (int) Math.min(byteCount, segment.limit - segment.pos);
            out.write(segment.data, segment.pos, min);
            segment.pos += min;
            long j = min;
            this.size -= j;
            byteCount -= j;
            if (segment.pos == segment.limit) {
                Segment pop = segment.pop();
                this.head = pop;
                SegmentPool.recycle(segment);
                segment = pop;
            }
        }
        return this;
    }

    public final Buffer readFrom(InputStream input) throws IOException {
        Intrinsics.checkParameterIsNotNull(input, "input");
        readFrom(input, LongCompanionObject.MAX_VALUE, true);
        return this;
    }

    public final Buffer readFrom(InputStream input, long byteCount) throws IOException {
        Intrinsics.checkParameterIsNotNull(input, "input");
        if (!(byteCount >= 0)) {
            throw new IllegalArgumentException(("byteCount < 0: " + byteCount).toString());
        }
        readFrom(input, byteCount, false);
        return this;
    }

    private final void readFrom(InputStream input, long byteCount, boolean forever) throws IOException {
        while (true) {
            if (byteCount <= 0 && !forever) {
                return;
            }
            Segment writableSegment$jvm = writableSegment$jvm(1);
            int read = input.read(writableSegment$jvm.data, writableSegment$jvm.limit, (int) Math.min(byteCount, 8192 - writableSegment$jvm.limit));
            if (read == -1) {
                if (!forever) {
                    throw new EOFException();
                }
                return;
            } else {
                writableSegment$jvm.limit += read;
                long j = read;
                this.size += j;
                byteCount -= j;
            }
        }
    }

    public final long completeSegmentByteCount() {
        long j = this.size;
        if (j == 0) {
            return 0L;
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        Segment segment2 = segment.prev;
        if (segment2 == null) {
            Intrinsics.throwNpe();
        }
        return (segment2.limit >= 8192 || !segment2.owner) ? j : j - (segment2.limit - segment2.pos);
    }

    @Override // okio.BufferedSource
    public byte readByte() throws EOFException {
        if (this.size == 0) {
            throw new EOFException();
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        int i = segment.pos;
        int i2 = segment.limit;
        int i3 = i + 1;
        byte b = segment.data[i];
        this.size--;
        if (i3 == i2) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        } else {
            segment.pos = i3;
        }
        return b;
    }

    public final byte getByte(long pos) {
        Util.checkOffsetAndCount(this.size, pos, 1L);
        Segment segment = this.head;
        if (segment == null) {
            Segment segment2 = (Segment) null;
            Intrinsics.throwNpe();
            return segment2.data[(int) ((segment2.pos + pos) - (-1))];
        }
        if (size() - pos < pos) {
            long size = size();
            while (size > pos) {
                segment = segment.prev;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                size -= segment.limit - segment.pos;
            }
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            return segment.data[(int) ((segment.pos + pos) - size)];
        }
        long j = 0;
        while (true) {
            long j2 = (segment.limit - segment.pos) + j;
            if (j2 > pos) {
                break;
            }
            segment = segment.next;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            j = j2;
        }
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        return segment.data[(int) ((segment.pos + pos) - j)];
    }

    @Override // okio.BufferedSource
    public short readShort() throws EOFException {
        if (this.size < 2) {
            throw new EOFException();
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        int i = segment.pos;
        int i2 = segment.limit;
        if (i2 - i < 2) {
            return (short) (((readByte() & UByte.MAX_VALUE) << 8) | (readByte() & UByte.MAX_VALUE));
        }
        byte[] bArr = segment.data;
        int i3 = i + 1;
        int i4 = i3 + 1;
        int i5 = ((bArr[i] & UByte.MAX_VALUE) << 8) | (bArr[i3] & UByte.MAX_VALUE);
        this.size -= 2;
        if (i4 == i2) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        } else {
            segment.pos = i4;
        }
        return (short) i5;
    }

    @Override // okio.BufferedSource
    public int readInt() throws EOFException {
        if (this.size < 4) {
            throw new EOFException();
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        int i = segment.pos;
        int i2 = segment.limit;
        if (i2 - i < 4) {
            return ((readByte() & UByte.MAX_VALUE) << 24) | ((readByte() & UByte.MAX_VALUE) << 16) | ((readByte() & UByte.MAX_VALUE) << 8) | (readByte() & UByte.MAX_VALUE);
        }
        byte[] bArr = segment.data;
        int i3 = i + 1;
        int i4 = i3 + 1;
        int i5 = ((bArr[i] & UByte.MAX_VALUE) << 24) | ((bArr[i3] & UByte.MAX_VALUE) << 16);
        int i6 = i4 + 1;
        int i7 = i5 | ((bArr[i4] & UByte.MAX_VALUE) << 8);
        int i8 = i6 + 1;
        int i9 = i7 | (bArr[i6] & UByte.MAX_VALUE);
        this.size -= 4;
        if (i8 == i2) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        } else {
            segment.pos = i8;
        }
        return i9;
    }

    @Override // okio.BufferedSource
    public long readLong() throws EOFException {
        if (this.size < 8) {
            throw new EOFException();
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        int i = segment.pos;
        int i2 = segment.limit;
        if (i2 - i < 8) {
            return ((readInt() & 4294967295L) << 32) | (4294967295L & readInt());
        }
        byte[] bArr = segment.data;
        long j = (bArr[i] & 255) << 56;
        int i3 = i + 1 + 1 + 1;
        long j2 = j | ((bArr[r7] & 255) << 48) | ((bArr[r1] & 255) << 40);
        long j3 = j2 | ((bArr[i3] & 255) << 32) | ((bArr[r1] & 255) << 24);
        long j4 = j3 | ((bArr[r8] & 255) << 16);
        long j5 = j4 | ((bArr[r1] & 255) << 8);
        int i4 = i3 + 1 + 1 + 1 + 1 + 1;
        long j6 = j5 | (bArr[r8] & 255);
        this.size -= 8;
        if (i4 == i2) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        } else {
            segment.pos = i4;
        }
        return j6;
    }

    @Override // okio.BufferedSource
    public short readShortLe() throws EOFException {
        return Util.reverseBytes(readShort());
    }

    @Override // okio.BufferedSource
    public int readIntLe() throws EOFException {
        return Util.reverseBytes(readInt());
    }

    @Override // okio.BufferedSource
    public long readLongLe() throws EOFException {
        return Util.reverseBytes(readLong());
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b7 A[EDGE_INSN: B:49:0x00b7->B:43:0x00b7 BREAK  A[LOOP:0: B:4:0x0010->B:48:?], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00af  */
    @Override // okio.BufferedSource
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public long readDecimalLong() throws EOFException {
        long j = 0;
        if (this.size == 0) {
            throw new EOFException();
        }
        int i = 0;
        long j2 = -7;
        boolean z = false;
        boolean z2 = false;
        do {
            Segment segment = this.head;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            byte[] bArr = segment.data;
            int i2 = segment.pos;
            int i3 = segment.limit;
            while (i2 < i3) {
                byte b = bArr[i2];
                byte b2 = (byte) 48;
                if (b >= b2 && b <= ((byte) 57)) {
                    int i4 = b2 - b;
                    if (j < -922337203685477580L || (j == -922337203685477580L && i4 < j2)) {
                        Buffer writeByte = new Buffer().writeDecimalLong(j).writeByte((int) b);
                        if (!z) {
                            writeByte.readByte();
                        }
                        throw new NumberFormatException("Number too large: " + writeByte.readUtf8());
                    }
                    j = (j * 10) + i4;
                } else if (b == ((byte) 45) && i == 0) {
                    j2--;
                    z = true;
                } else {
                    if (i == 0) {
                        throw new NumberFormatException("Expected leading [0-9] or '-' character but was 0x" + Integer.toHexString(b));
                    }
                    z2 = true;
                    if (i2 != i3) {
                        this.head = segment.pop();
                        SegmentPool.recycle(segment);
                    } else {
                        segment.pos = i2;
                    }
                    if (!z2) {
                        break;
                    }
                }
                i2++;
                i++;
            }
            if (i2 != i3) {
            }
            if (!z2) {
            }
        } while (this.head != null);
        this.size -= i;
        return z ? j : -j;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00b2 A[EDGE_INSN: B:42:0x00b2->B:39:0x00b2 BREAK  A[LOOP:0: B:4:0x000b->B:41:?], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00aa  */
    @Override // okio.BufferedSource
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public long readHexadecimalUnsignedLong() throws EOFException {
        int i;
        if (this.size == 0) {
            throw new EOFException();
        }
        boolean z = false;
        int i2 = 0;
        long j = 0;
        do {
            Segment segment = this.head;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            byte[] bArr = segment.data;
            int i3 = segment.pos;
            int i4 = segment.limit;
            while (i3 < i4) {
                byte b = bArr[i3];
                byte b2 = (byte) 48;
                if (b < b2 || b > ((byte) 57)) {
                    byte b3 = (byte) 97;
                    if ((b >= b3 && b <= ((byte) 102)) || (b >= (b3 = (byte) 65) && b <= ((byte) 70))) {
                        i = (b - b3) + 10;
                    } else {
                        if (i2 == 0) {
                            throw new NumberFormatException("Expected leading [0-9a-fA-F] character but was 0x" + Integer.toHexString(b));
                        }
                        z = true;
                        if (i3 != i4) {
                            this.head = segment.pop();
                            SegmentPool.recycle(segment);
                        } else {
                            segment.pos = i3;
                        }
                        if (!z) {
                            break;
                        }
                    }
                } else {
                    i = b - b2;
                }
                if (((-1152921504606846976L) & j) != 0) {
                    throw new NumberFormatException("Number too large: " + new Buffer().writeHexadecimalUnsignedLong(j).writeByte((int) b).readUtf8());
                }
                j = (j << 4) | i;
                i3++;
                i2++;
            }
            if (i3 != i4) {
            }
            if (!z) {
            }
        } while (this.head != null);
        this.size -= i2;
        return j;
    }

    @Override // okio.BufferedSource
    public ByteString readByteString() {
        return new ByteString(readByteArray());
    }

    @Override // okio.BufferedSource
    public ByteString readByteString(long byteCount) throws EOFException {
        return new ByteString(readByteArray(byteCount));
    }

    @Override // okio.BufferedSource
    public int select(Options options) {
        Intrinsics.checkParameterIsNotNull(options, "options");
        int selectPrefix$jvm$default = selectPrefix$jvm$default(this, options, false, 2, null);
        if (selectPrefix$jvm$default == -1) {
            return -1;
        }
        skip(options.getByteStrings()[selectPrefix$jvm$default].size());
        return selectPrefix$jvm$default;
    }

    public static /* bridge */ /* synthetic */ int selectPrefix$jvm$default(Buffer buffer, Options options, boolean z, int i, Object obj) {
        if ((i & 2) != 0) {
            z = false;
        }
        return buffer.selectPrefix$jvm(options, z);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x005f, code lost:
    
        if (r20 == false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0061, code lost:
    
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0062, code lost:
    
        return r10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int selectPrefix$jvm(Options options, boolean selectTruncated) {
        int i;
        int i2;
        Intrinsics.checkParameterIsNotNull(options, "options");
        Segment segment = this.head;
        int i3 = -2;
        if (segment == null) {
            return selectTruncated ? -2 : -1;
        }
        byte[] bArr = segment.data;
        int i4 = segment.pos;
        int i5 = segment.limit;
        int[] trie = options.getTrie();
        int i6 = -1;
        int i7 = i4;
        int i8 = i5;
        Segment segment2 = segment;
        byte[] bArr2 = bArr;
        int i9 = 0;
        loop0: while (true) {
            int i10 = i9 + 1;
            int i11 = trie[i9];
            int i12 = i10 + 1;
            int i13 = trie[i10];
            if (i13 != -1) {
                i6 = i13;
            }
            if (segment2 == null) {
                break;
            }
            if (i11 >= 0) {
                int i14 = i7 + 1;
                int i15 = bArr2[i7] & UByte.MAX_VALUE;
                int i16 = i12 + i11;
                while (i12 != i16) {
                    if (i15 == trie[i12]) {
                        i = trie[i12 + i11];
                        if (i14 == i8) {
                            Segment segment3 = segment2.next;
                            if (segment3 == null) {
                                Intrinsics.throwNpe();
                            }
                            i2 = segment3.pos;
                            byte[] bArr3 = segment3.data;
                            int i17 = segment3.limit;
                            if (segment3 == segment) {
                                i8 = i17;
                                bArr2 = bArr3;
                                segment2 = (Segment) null;
                            } else {
                                i8 = i17;
                                bArr2 = bArr3;
                                segment2 = segment3;
                            }
                        } else {
                            i2 = i14;
                        }
                    } else {
                        i12++;
                    }
                }
                return i6;
            }
            int i18 = i12 + (i11 * (-1));
            while (true) {
                i2 = i7 + 1;
                int i19 = i12 + 1;
                if ((bArr2[i7] & UByte.MAX_VALUE) != trie[i12]) {
                    return i6;
                }
                boolean z = i19 == i18;
                if (i2 == i8) {
                    if (segment2 == null) {
                        Intrinsics.throwNpe();
                    }
                    Segment segment4 = segment2.next;
                    if (segment4 == null) {
                        Intrinsics.throwNpe();
                    }
                    int i20 = segment4.pos;
                    bArr2 = segment4.data;
                    i8 = segment4.limit;
                    if (segment4 == segment) {
                        if (!z) {
                            break loop0;
                        }
                        segment4 = (Segment) null;
                    }
                    segment2 = segment4;
                    i2 = i20;
                }
                if (z) {
                    i = trie[i19];
                    break;
                }
                i7 = i2;
                i12 = i19;
            }
            if (i >= 0) {
                return i;
            }
            int i21 = -i;
            i7 = i2;
            i9 = i21;
            i3 = -2;
        }
    }

    @Override // okio.BufferedSource
    public void readFully(Buffer sink, long byteCount) throws EOFException {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        long j = this.size;
        if (j < byteCount) {
            sink.write(this, j);
            throw new EOFException();
        }
        sink.write(this, byteCount);
    }

    @Override // okio.BufferedSource
    public long readAll(Sink sink) throws IOException {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        long j = this.size;
        if (j > 0) {
            sink.write(this, j);
        }
        return j;
    }

    @Override // okio.BufferedSource
    public String readUtf8() {
        return readString(this.size, Charsets.UTF_8);
    }

    @Override // okio.BufferedSource
    public String readUtf8(long byteCount) throws EOFException {
        return readString(byteCount, Charsets.UTF_8);
    }

    @Override // okio.BufferedSource
    public String readString(Charset charset) {
        Intrinsics.checkParameterIsNotNull(charset, "charset");
        return readString(this.size, charset);
    }

    @Override // okio.BufferedSource
    public String readString(long byteCount, Charset charset) throws EOFException {
        Intrinsics.checkParameterIsNotNull(charset, "charset");
        if (!(byteCount >= 0 && byteCount <= ((long) Integer.MAX_VALUE))) {
            throw new IllegalArgumentException(("byteCount: " + byteCount).toString());
        }
        if (this.size < byteCount) {
            throw new EOFException();
        }
        if (byteCount == 0) {
            return "";
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        if (segment.pos + byteCount > segment.limit) {
            return new String(readByteArray(byteCount), charset);
        }
        int i = (int) byteCount;
        String str = new String(segment.data, segment.pos, i, charset);
        segment.pos += i;
        this.size -= byteCount;
        if (segment.pos == segment.limit) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        }
        return str;
    }

    @Override // okio.BufferedSource
    public String readUtf8Line() throws EOFException {
        long indexOf = indexOf((byte) 10);
        if (indexOf != -1) {
            return readUtf8Line$jvm(indexOf);
        }
        long j = this.size;
        if (j != 0) {
            return readUtf8(j);
        }
        return null;
    }

    @Override // okio.BufferedSource
    public String readUtf8LineStrict() throws EOFException {
        return readUtf8LineStrict(LongCompanionObject.MAX_VALUE);
    }

    @Override // okio.BufferedSource
    public String readUtf8LineStrict(long limit) throws EOFException {
        if (!(limit >= 0)) {
            throw new IllegalArgumentException(("limit < 0: " + limit).toString());
        }
        long j = LongCompanionObject.MAX_VALUE;
        if (limit != LongCompanionObject.MAX_VALUE) {
            j = limit + 1;
        }
        byte b = (byte) 10;
        long indexOf = indexOf(b, 0L, j);
        if (indexOf != -1) {
            return readUtf8Line$jvm(indexOf);
        }
        if (j < this.size && getByte(j - 1) == ((byte) 13) && getByte(j) == b) {
            return readUtf8Line$jvm(j);
        }
        Buffer buffer = new Buffer();
        copyTo(buffer, 0L, Math.min(32, this.size));
        throw new EOFException("\\n not found: limit=" + Math.min(this.size, limit) + " content=" + buffer.readByteString().hex() + Typography.ellipsis);
    }

    public final String readUtf8Line$jvm(long newline) throws EOFException {
        if (newline > 0) {
            long j = newline - 1;
            if (getByte(j) == ((byte) 13)) {
                String readUtf8 = readUtf8(j);
                skip(2L);
                return readUtf8;
            }
        }
        String readUtf82 = readUtf8(newline);
        skip(1L);
        return readUtf82;
    }

    @Override // okio.BufferedSource
    public int readUtf8CodePoint() throws EOFException {
        int i;
        int i2;
        int i3;
        if (this.size == 0) {
            throw new EOFException();
        }
        byte b = getByte(0L);
        if ((b & ByteCompanionObject.MIN_VALUE) == 0) {
            i = b & ByteCompanionObject.MAX_VALUE;
            i3 = 0;
            i2 = 1;
        } else if ((b & 224) == 192) {
            i = b & 31;
            i2 = 2;
            i3 = 128;
        } else if ((b & 240) == 224) {
            i = b & 15;
            i2 = 3;
            i3 = 2048;
        } else {
            if ((b & 248) != 240) {
                skip(1L);
                return Utf8.REPLACEMENT_CODE_POINT;
            }
            i = b & 7;
            i2 = 4;
            i3 = 65536;
        }
        long j = i2;
        if (this.size < j) {
            throw new EOFException("size < " + i2 + ": " + this.size + " (to read code point prefixed 0x" + Integer.toHexString(b) + ")");
        }
        for (int i4 = 1; i4 < i2; i4++) {
            long j2 = i4;
            byte b2 = getByte(j2);
            if ((b2 & 192) != 128) {
                skip(j2);
                return Utf8.REPLACEMENT_CODE_POINT;
            }
            i = (i << 6) | (b2 & Utf8.REPLACEMENT_BYTE);
        }
        skip(j);
        return i > 1114111 ? Utf8.REPLACEMENT_CODE_POINT : ((55296 <= i && 57343 >= i) || i < i3) ? Utf8.REPLACEMENT_CODE_POINT : i;
    }

    @Override // okio.BufferedSource
    public byte[] readByteArray() {
        return readByteArray(this.size);
    }

    @Override // okio.BufferedSource
    public byte[] readByteArray(long byteCount) throws EOFException {
        if (!(byteCount >= 0 && byteCount <= ((long) Integer.MAX_VALUE))) {
            throw new IllegalArgumentException(("byteCount: " + byteCount).toString());
        }
        if (this.size < byteCount) {
            throw new EOFException();
        }
        byte[] bArr = new byte[(int) byteCount];
        readFully(bArr);
        return bArr;
    }

    @Override // okio.BufferedSource
    public int read(byte[] sink) {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        return read(sink, 0, sink.length);
    }

    @Override // okio.BufferedSource
    public void readFully(byte[] sink) throws EOFException {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        int i = 0;
        while (i < sink.length) {
            int read = read(sink, i, sink.length - i);
            if (read == -1) {
                throw new EOFException();
            }
            i += read;
        }
    }

    @Override // okio.BufferedSource
    public int read(byte[] sink, int offset, int byteCount) {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        Util.checkOffsetAndCount(sink.length, offset, byteCount);
        Segment segment = this.head;
        if (segment == null) {
            return -1;
        }
        int min = Math.min(byteCount, segment.limit - segment.pos);
        System.arraycopy(segment.data, segment.pos, sink, offset, min);
        segment.pos += min;
        this.size -= min;
        if (segment.pos == segment.limit) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        }
        return min;
    }

    @Override // java.nio.channels.ReadableByteChannel
    public int read(ByteBuffer sink) throws IOException {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        Segment segment = this.head;
        if (segment == null) {
            return -1;
        }
        int min = Math.min(sink.remaining(), segment.limit - segment.pos);
        sink.put(segment.data, segment.pos, min);
        segment.pos += min;
        this.size -= min;
        if (segment.pos == segment.limit) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        }
        return min;
    }

    public final void clear() {
        skip(this.size);
    }

    @Override // okio.BufferedSource
    public void skip(long byteCount) throws EOFException {
        while (byteCount > 0) {
            Segment segment = this.head;
            if (segment == null) {
                throw new EOFException();
            }
            int min = (int) Math.min(byteCount, segment.limit - segment.pos);
            long j = min;
            this.size -= j;
            byteCount -= j;
            segment.pos += min;
            if (segment.pos == segment.limit) {
                this.head = segment.pop();
                SegmentPool.recycle(segment);
            }
        }
    }

    @Override // okio.BufferedSink
    public Buffer write(ByteString byteString) {
        Intrinsics.checkParameterIsNotNull(byteString, "byteString");
        byteString.write$jvm(this);
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeUtf8(String string) {
        Intrinsics.checkParameterIsNotNull(string, "string");
        return writeUtf8(string, 0, string.length());
    }

    @Override // okio.BufferedSink
    public Buffer writeUtf8(String string, int beginIndex, int endIndex) {
        int i;
        Intrinsics.checkParameterIsNotNull(string, "string");
        if (!(beginIndex >= 0)) {
            throw new IllegalArgumentException(("beginIndex < 0: " + beginIndex).toString());
        }
        if (!(endIndex >= beginIndex)) {
            throw new IllegalArgumentException(("endIndex < beginIndex: " + endIndex + " < " + beginIndex).toString());
        }
        if (!(endIndex <= string.length())) {
            throw new IllegalArgumentException(("endIndex > string.length: " + endIndex + " > " + string.length()).toString());
        }
        while (beginIndex < endIndex) {
            char charAt = string.charAt(beginIndex);
            if (charAt < 128) {
                Segment writableSegment$jvm = writableSegment$jvm(1);
                byte[] bArr = writableSegment$jvm.data;
                int i2 = writableSegment$jvm.limit - beginIndex;
                int min = Math.min(endIndex, 8192 - i2);
                i = beginIndex + 1;
                bArr[beginIndex + i2] = (byte) charAt;
                while (i < min) {
                    char charAt2 = string.charAt(i);
                    if (charAt2 >= 128) {
                        break;
                    }
                    bArr[i + i2] = (byte) charAt2;
                    i++;
                }
                int i3 = (i2 + i) - writableSegment$jvm.limit;
                writableSegment$jvm.limit += i3;
                this.size += i3;
            } else {
                if (charAt < 2048) {
                    Segment writableSegment$jvm2 = writableSegment$jvm(2);
                    writableSegment$jvm2.data[writableSegment$jvm2.limit] = (byte) ((charAt >> 6) | 192);
                    writableSegment$jvm2.data[writableSegment$jvm2.limit + 1] = (byte) ((charAt & '?') | 128);
                    writableSegment$jvm2.limit += 2;
                    this.size += 2;
                } else if (charAt < 55296 || charAt > 57343) {
                    Segment writableSegment$jvm3 = writableSegment$jvm(3);
                    writableSegment$jvm3.data[writableSegment$jvm3.limit] = (byte) ((charAt >> '\f') | 224);
                    writableSegment$jvm3.data[writableSegment$jvm3.limit + 1] = (byte) ((63 & (charAt >> 6)) | 128);
                    writableSegment$jvm3.data[writableSegment$jvm3.limit + 2] = (byte) ((charAt & '?') | 128);
                    writableSegment$jvm3.limit += 3;
                    this.size += 3;
                } else {
                    i = beginIndex + 1;
                    char charAt3 = i < endIndex ? string.charAt(i) : (char) 0;
                    if (charAt > 56319 || 56320 > charAt3 || 57343 < charAt3) {
                        writeByte(63);
                    } else {
                        int i4 = (((charAt & 1023) << 10) | (charAt3 & 1023)) + 65536;
                        Segment writableSegment$jvm4 = writableSegment$jvm(4);
                        writableSegment$jvm4.data[writableSegment$jvm4.limit] = (byte) ((i4 >> 18) | 240);
                        writableSegment$jvm4.data[writableSegment$jvm4.limit + 1] = (byte) (((i4 >> 12) & 63) | 128);
                        writableSegment$jvm4.data[writableSegment$jvm4.limit + 2] = (byte) (((i4 >> 6) & 63) | 128);
                        writableSegment$jvm4.data[writableSegment$jvm4.limit + 3] = (byte) ((i4 & 63) | 128);
                        writableSegment$jvm4.limit += 4;
                        this.size += 4;
                        beginIndex += 2;
                    }
                }
                beginIndex++;
            }
            beginIndex = i;
        }
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeUtf8CodePoint(int codePoint) {
        if (codePoint < 128) {
            writeByte(codePoint);
        } else if (codePoint < 2048) {
            Segment writableSegment$jvm = writableSegment$jvm(2);
            writableSegment$jvm.data[writableSegment$jvm.limit] = (byte) ((codePoint >> 6) | 192);
            writableSegment$jvm.data[writableSegment$jvm.limit + 1] = (byte) ((codePoint & 63) | 128);
            writableSegment$jvm.limit += 2;
            this.size += 2;
        } else if (55296 <= codePoint && 57343 >= codePoint) {
            writeByte(63);
        } else if (codePoint < 65536) {
            Segment writableSegment$jvm2 = writableSegment$jvm(3);
            writableSegment$jvm2.data[writableSegment$jvm2.limit] = (byte) ((codePoint >> 12) | 224);
            writableSegment$jvm2.data[writableSegment$jvm2.limit + 1] = (byte) (((codePoint >> 6) & 63) | 128);
            writableSegment$jvm2.data[writableSegment$jvm2.limit + 2] = (byte) ((codePoint & 63) | 128);
            writableSegment$jvm2.limit += 3;
            this.size += 3;
        } else if (codePoint <= 1114111) {
            Segment writableSegment$jvm3 = writableSegment$jvm(4);
            writableSegment$jvm3.data[writableSegment$jvm3.limit] = (byte) ((codePoint >> 18) | 240);
            writableSegment$jvm3.data[writableSegment$jvm3.limit + 1] = (byte) (((codePoint >> 12) & 63) | 128);
            writableSegment$jvm3.data[writableSegment$jvm3.limit + 2] = (byte) (((codePoint >> 6) & 63) | 128);
            writableSegment$jvm3.data[writableSegment$jvm3.limit + 3] = (byte) ((codePoint & 63) | 128);
            writableSegment$jvm3.limit += 4;
            this.size += 4;
        } else {
            throw new IllegalArgumentException("Unexpected code point: " + Integer.toHexString(codePoint));
        }
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeString(String string, Charset charset) {
        Intrinsics.checkParameterIsNotNull(string, "string");
        Intrinsics.checkParameterIsNotNull(charset, "charset");
        return writeString(string, 0, string.length(), charset);
    }

    @Override // okio.BufferedSink
    public Buffer writeString(String string, int beginIndex, int endIndex, Charset charset) {
        Intrinsics.checkParameterIsNotNull(string, "string");
        Intrinsics.checkParameterIsNotNull(charset, "charset");
        if (!(beginIndex >= 0)) {
            throw new IllegalArgumentException(("beginIndex < 0: " + beginIndex).toString());
        }
        if (!(endIndex >= beginIndex)) {
            throw new IllegalArgumentException(("endIndex < beginIndex: " + endIndex + " < " + beginIndex).toString());
        }
        if (!(endIndex <= string.length())) {
            throw new IllegalArgumentException(("endIndex > string.length: " + endIndex + " > " + string.length()).toString());
        }
        if (Intrinsics.areEqual(charset, Charsets.UTF_8)) {
            return writeUtf8(string, beginIndex, endIndex);
        }
        String substring = string.substring(beginIndex, endIndex);
        Intrinsics.checkExpressionValueIsNotNull(substring, "(this as java.lang.Strin…ing(startIndex, endIndex)");
        if (substring == null) {
            throw new TypeCastException("null cannot be cast to non-null type java.lang.String");
        }
        byte[] bytes = substring.getBytes(charset);
        Intrinsics.checkExpressionValueIsNotNull(bytes, "(this as java.lang.String).getBytes(charset)");
        return write(bytes, 0, bytes.length);
    }

    @Override // okio.BufferedSink
    public Buffer write(byte[] source) {
        Intrinsics.checkParameterIsNotNull(source, "source");
        return write(source, 0, source.length);
    }

    @Override // okio.BufferedSink
    public Buffer write(byte[] source, int offset, int byteCount) {
        Intrinsics.checkParameterIsNotNull(source, "source");
        long j = byteCount;
        Util.checkOffsetAndCount(source.length, offset, j);
        int i = byteCount + offset;
        while (offset < i) {
            Segment writableSegment$jvm = writableSegment$jvm(1);
            int min = Math.min(i - offset, 8192 - writableSegment$jvm.limit);
            System.arraycopy(source, offset, writableSegment$jvm.data, writableSegment$jvm.limit, min);
            offset += min;
            writableSegment$jvm.limit += min;
        }
        this.size += j;
        return this;
    }

    @Override // java.nio.channels.WritableByteChannel
    public int write(ByteBuffer source) throws IOException {
        Intrinsics.checkParameterIsNotNull(source, "source");
        int remaining = source.remaining();
        int i = remaining;
        while (i > 0) {
            Segment writableSegment$jvm = writableSegment$jvm(1);
            int min = Math.min(i, 8192 - writableSegment$jvm.limit);
            source.get(writableSegment$jvm.data, writableSegment$jvm.limit, min);
            i -= min;
            writableSegment$jvm.limit += min;
        }
        this.size += remaining;
        return remaining;
    }

    @Override // okio.BufferedSink
    public long writeAll(Source source) throws IOException {
        Intrinsics.checkParameterIsNotNull(source, "source");
        long j = 0;
        while (true) {
            long read = source.read(this, 8192);
            if (read == -1) {
                return j;
            }
            j += read;
        }
    }

    @Override // okio.BufferedSink
    public BufferedSink write(Source source, long byteCount) throws IOException {
        Intrinsics.checkParameterIsNotNull(source, "source");
        while (byteCount > 0) {
            long read = source.read(this, byteCount);
            if (read == -1) {
                throw new EOFException();
            }
            byteCount -= read;
        }
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeByte(int b) {
        Segment writableSegment$jvm = writableSegment$jvm(1);
        byte[] bArr = writableSegment$jvm.data;
        int i = writableSegment$jvm.limit;
        writableSegment$jvm.limit = i + 1;
        bArr[i] = (byte) b;
        this.size++;
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeShort(int s) {
        Segment writableSegment$jvm = writableSegment$jvm(2);
        byte[] bArr = writableSegment$jvm.data;
        int i = writableSegment$jvm.limit;
        int i2 = i + 1;
        bArr[i] = (byte) ((s >>> 8) & 255);
        bArr[i2] = (byte) (s & 255);
        writableSegment$jvm.limit = i2 + 1;
        this.size += 2;
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeShortLe(int s) {
        return writeShort((int) Util.reverseBytes((short) s));
    }

    @Override // okio.BufferedSink
    public Buffer writeInt(int i) {
        Segment writableSegment$jvm = writableSegment$jvm(4);
        byte[] bArr = writableSegment$jvm.data;
        int i2 = writableSegment$jvm.limit;
        int i3 = i2 + 1;
        bArr[i2] = (byte) ((i >>> 24) & 255);
        int i4 = i3 + 1;
        bArr[i3] = (byte) ((i >>> 16) & 255);
        int i5 = i4 + 1;
        bArr[i4] = (byte) ((i >>> 8) & 255);
        bArr[i5] = (byte) (i & 255);
        writableSegment$jvm.limit = i5 + 1;
        this.size += 4;
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeIntLe(int i) {
        return writeInt(Util.reverseBytes(i));
    }

    @Override // okio.BufferedSink
    public Buffer writeLong(long v) {
        Segment writableSegment$jvm = writableSegment$jvm(8);
        byte[] bArr = writableSegment$jvm.data;
        int i = writableSegment$jvm.limit;
        int i2 = i + 1;
        bArr[i] = (byte) ((v >>> 56) & 255);
        int i3 = i2 + 1;
        bArr[i2] = (byte) ((v >>> 48) & 255);
        int i4 = i3 + 1;
        bArr[i3] = (byte) ((v >>> 40) & 255);
        int i5 = i4 + 1;
        bArr[i4] = (byte) ((v >>> 32) & 255);
        int i6 = i5 + 1;
        bArr[i5] = (byte) ((v >>> 24) & 255);
        int i7 = i6 + 1;
        bArr[i6] = (byte) ((v >>> 16) & 255);
        int i8 = i7 + 1;
        bArr[i7] = (byte) ((v >>> 8) & 255);
        bArr[i8] = (byte) (v & 255);
        writableSegment$jvm.limit = i8 + 1;
        this.size += 8;
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeLongLe(long v) {
        return writeLong(Util.reverseBytes(v));
    }

    @Override // okio.BufferedSink
    public Buffer writeDecimalLong(long v) {
        int i;
        if (v == 0) {
            return writeByte(48);
        }
        boolean z = false;
        int i2 = 1;
        if (v < 0) {
            v = -v;
            if (v < 0) {
                return writeUtf8("-9223372036854775808");
            }
            z = true;
        }
        if (v < 100000000) {
            if (v >= 10000) {
                i = v < 1000000 ? v < 100000 ? 5 : 6 : v < 10000000 ? 7 : 8;
            } else if (v >= 100) {
                i = v < 1000 ? 3 : 4;
            } else if (v >= 10) {
                i2 = 2;
            }
            i2 = i;
        } else if (v < 1000000000000L) {
            if (v < 10000000000L) {
                i2 = v < 1000000000 ? 9 : 10;
            } else {
                i = v < 100000000000L ? 11 : 12;
                i2 = i;
            }
        } else if (v >= 1000000000000000L) {
            i2 = v < 100000000000000000L ? v < 10000000000000000L ? 16 : 17 : v < 1000000000000000000L ? 18 : 19;
        } else if (v < 10000000000000L) {
            i2 = 13;
        } else {
            i = v < 100000000000000L ? 14 : 15;
            i2 = i;
        }
        if (z) {
            i2++;
        }
        Segment writableSegment$jvm = writableSegment$jvm(i2);
        byte[] bArr = writableSegment$jvm.data;
        int i3 = writableSegment$jvm.limit + i2;
        while (v != 0) {
            long j = 10;
            i3--;
            bArr[i3] = DIGITS[(int) (v % j)];
            v /= j;
        }
        if (z) {
            bArr[i3 - 1] = (byte) 45;
        }
        writableSegment$jvm.limit += i2;
        this.size += i2;
        return this;
    }

    @Override // okio.BufferedSink
    public Buffer writeHexadecimalUnsignedLong(long v) {
        if (v == 0) {
            return writeByte(48);
        }
        int numberOfTrailingZeros = (Long.numberOfTrailingZeros(Long.highestOneBit(v)) / 4) + 1;
        Segment writableSegment$jvm = writableSegment$jvm(numberOfTrailingZeros);
        byte[] bArr = writableSegment$jvm.data;
        int i = writableSegment$jvm.limit;
        for (int i2 = (writableSegment$jvm.limit + numberOfTrailingZeros) - 1; i2 >= i; i2--) {
            bArr[i2] = DIGITS[(int) (15 & v)];
            v >>>= 4;
        }
        writableSegment$jvm.limit += numberOfTrailingZeros;
        this.size += numberOfTrailingZeros;
        return this;
    }

    public final Segment writableSegment$jvm(int minimumCapacity) {
        if (!(minimumCapacity >= 1 && minimumCapacity <= 8192)) {
            throw new IllegalArgumentException("unexpected capacity".toString());
        }
        Segment segment = this.head;
        if (segment == null) {
            Segment take = SegmentPool.take();
            this.head = take;
            take.prev = take;
            take.next = take;
            return take;
        }
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        Segment segment2 = segment.prev;
        if (segment2 == null) {
            Intrinsics.throwNpe();
        }
        return (segment2.limit + minimumCapacity > 8192 || !segment2.owner) ? segment2.push(SegmentPool.take()) : segment2;
    }

    @Override // okio.Sink
    public void write(Buffer source, long byteCount) {
        Segment segment;
        Intrinsics.checkParameterIsNotNull(source, "source");
        if (!(source != this)) {
            throw new IllegalArgumentException("source == this".toString());
        }
        Util.checkOffsetAndCount(source.size, 0L, byteCount);
        while (byteCount > 0) {
            Segment segment2 = source.head;
            if (segment2 == null) {
                Intrinsics.throwNpe();
            }
            int i = segment2.limit;
            if (source.head == null) {
                Intrinsics.throwNpe();
            }
            if (byteCount < i - r2.pos) {
                Segment segment3 = this.head;
                if (segment3 != null) {
                    if (segment3 == null) {
                        Intrinsics.throwNpe();
                    }
                    segment = segment3.prev;
                } else {
                    segment = null;
                }
                if (segment != null && segment.owner) {
                    if ((segment.limit + byteCount) - (segment.shared ? 0 : segment.pos) <= 8192) {
                        Segment segment4 = source.head;
                        if (segment4 == null) {
                            Intrinsics.throwNpe();
                        }
                        segment4.writeTo(segment, (int) byteCount);
                        source.size -= byteCount;
                        this.size += byteCount;
                        return;
                    }
                }
                Segment segment5 = source.head;
                if (segment5 == null) {
                    Intrinsics.throwNpe();
                }
                source.head = segment5.split((int) byteCount);
            }
            Segment segment6 = source.head;
            if (segment6 == null) {
                Intrinsics.throwNpe();
            }
            long j = segment6.limit - segment6.pos;
            source.head = segment6.pop();
            Segment segment7 = this.head;
            if (segment7 == null) {
                this.head = segment6;
                segment6.prev = segment6;
                segment6.next = segment6.prev;
            } else {
                if (segment7 == null) {
                    Intrinsics.throwNpe();
                }
                Segment segment8 = segment7.prev;
                if (segment8 == null) {
                    Intrinsics.throwNpe();
                }
                segment8.push(segment6).compact();
            }
            source.size -= j;
            this.size += j;
            byteCount -= j;
        }
    }

    @Override // okio.Source
    public long read(Buffer sink, long byteCount) {
        Intrinsics.checkParameterIsNotNull(sink, "sink");
        if (!(byteCount >= 0)) {
            throw new IllegalArgumentException(("byteCount < 0: " + byteCount).toString());
        }
        long j = this.size;
        if (j == 0) {
            return -1L;
        }
        if (byteCount > j) {
            byteCount = j;
        }
        sink.write(this, byteCount);
        return byteCount;
    }

    @Override // okio.BufferedSource
    public long indexOf(byte b) {
        return indexOf(b, 0L, LongCompanionObject.MAX_VALUE);
    }

    private final <T> T seek(long fromIndex, Function2<? super Segment, ? super Long, ? extends T> lambda) {
        Segment segment = this.head;
        if (segment == null) {
            return lambda.invoke(null, -1L);
        }
        if (size() - fromIndex < fromIndex) {
            long size = size();
            while (size > fromIndex) {
                segment = segment.prev;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                size -= segment.limit - segment.pos;
            }
            return lambda.invoke(segment, Long.valueOf(size));
        }
        long j = 0;
        while (true) {
            long j2 = (segment.limit - segment.pos) + j;
            if (j2 <= fromIndex) {
                segment = segment.next;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                j = j2;
            } else {
                return lambda.invoke(segment, Long.valueOf(j));
            }
        }
    }

    @Override // okio.BufferedSource
    public long indexOf(byte b, long fromIndex) {
        return indexOf(b, fromIndex, LongCompanionObject.MAX_VALUE);
    }

    @Override // okio.BufferedSource
    public long indexOf(byte b, long fromIndex, long toIndex) {
        int i;
        long j = 0;
        if (!(0 <= fromIndex && toIndex >= fromIndex)) {
            throw new IllegalArgumentException(("size=" + this.size + " fromIndex=" + fromIndex + " toIndex=" + toIndex).toString());
        }
        long j2 = this.size;
        if (toIndex > j2) {
            toIndex = j2;
        }
        if (fromIndex == toIndex) {
            return -1L;
        }
        Segment segment = this.head;
        if (segment != null) {
            if (size() - fromIndex < fromIndex) {
                j = size();
                while (j > fromIndex) {
                    segment = segment.prev;
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    j -= segment.limit - segment.pos;
                }
                if (segment != null) {
                    while (j < toIndex) {
                        byte[] bArr = segment.data;
                        int min = (int) Math.min(segment.limit, (segment.pos + toIndex) - j);
                        i = (int) ((segment.pos + fromIndex) - j);
                        while (i < min) {
                            if (bArr[i] != b) {
                                i++;
                            }
                        }
                        fromIndex = (segment.limit - segment.pos) + j;
                        segment = segment.next;
                        if (segment == null) {
                            Intrinsics.throwNpe();
                        }
                        j = fromIndex;
                    }
                }
                return -1L;
            }
            while (true) {
                long j3 = (segment.limit - segment.pos) + j;
                if (j3 > fromIndex) {
                    break;
                }
                segment = segment.next;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                j = j3;
            }
            if (segment != null) {
                while (j < toIndex) {
                    byte[] bArr2 = segment.data;
                    int min2 = (int) Math.min(segment.limit, (segment.pos + toIndex) - j);
                    i = (int) ((segment.pos + fromIndex) - j);
                    while (i < min2) {
                        if (bArr2[i] != b) {
                            i++;
                        }
                    }
                    fromIndex = (segment.limit - segment.pos) + j;
                    segment = segment.next;
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    j = fromIndex;
                }
            }
            return -1L;
            return (i - segment.pos) + j;
        }
        return -1L;
    }

    @Override // okio.BufferedSource
    public long indexOf(ByteString bytes) throws IOException {
        Intrinsics.checkParameterIsNotNull(bytes, "bytes");
        return indexOf(bytes, 0L);
    }

    @Override // okio.BufferedSource
    public long indexOf(ByteString bytes, long fromIndex) throws IOException {
        int i;
        long j;
        Buffer buffer = this;
        long j2 = fromIndex;
        Intrinsics.checkParameterIsNotNull(bytes, "bytes");
        if (!(bytes.size() > 0)) {
            throw new IllegalArgumentException("bytes is empty".toString());
        }
        long j3 = 0;
        if (!(j2 >= 0)) {
            throw new IllegalArgumentException(("fromIndex < 0: " + j2).toString());
        }
        Segment segment = buffer.head;
        if (segment == null) {
            return -1L;
        }
        if (size() - j2 < j2) {
            j3 = size();
            while (j3 > j2) {
                segment = segment.prev;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                j3 -= segment.limit - segment.pos;
            }
            if (segment == null) {
                return -1L;
            }
            byte[] internalArray$jvm = bytes.internalArray$jvm();
            byte b = internalArray$jvm[0];
            int size = bytes.size();
            long j4 = (buffer.size - size) + 1;
            Segment segment2 = segment;
            while (j3 < j4) {
                byte[] bArr = segment2.data;
                long j5 = j4;
                int min = (int) Math.min(segment2.limit, (segment2.pos + j4) - j3);
                for (int i2 = (int) ((segment2.pos + j2) - j3); i2 < min; i2++) {
                    if (bArr[i2] == b) {
                        if (rangeEquals(segment2, i2 + 1, internalArray$jvm, 1, size)) {
                            j = i2 - segment2.pos;
                        }
                    }
                }
                j2 = (segment2.limit - segment2.pos) + j3;
                segment2 = segment2.next;
                if (segment2 == null) {
                    Intrinsics.throwNpe();
                }
                j3 = j2;
                j4 = j5;
            }
            return -1L;
        }
        while (true) {
            long j6 = (segment.limit - segment.pos) + j3;
            if (j6 > j2) {
                break;
            }
            segment = segment.next;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            buffer = this;
            j3 = j6;
        }
        if (segment == null) {
            return -1L;
        }
        byte[] internalArray$jvm2 = bytes.internalArray$jvm();
        byte b2 = internalArray$jvm2[0];
        int size2 = bytes.size();
        long j7 = 1 + (buffer.size - size2);
        Segment segment3 = segment;
        while (j3 < j7) {
            byte[] bArr2 = segment3.data;
            int min2 = (int) Math.min(segment3.limit, (segment3.pos + j7) - j3);
            int i3 = (int) ((segment3.pos + j2) - j3);
            while (i3 < min2) {
                if (bArr2[i3] == b2) {
                    i = i3;
                    if (rangeEquals(segment3, i3 + 1, internalArray$jvm2, 1, size2)) {
                        j = i - segment3.pos;
                    }
                } else {
                    i = i3;
                }
                i3 = i + 1;
            }
            j2 = (segment3.limit - segment3.pos) + j3;
            segment3 = segment3.next;
            if (segment3 == null) {
                Intrinsics.throwNpe();
            }
            j3 = j2;
        }
        return -1L;
        return j + j3;
    }

    @Override // okio.BufferedSource
    public long indexOfElement(ByteString targetBytes) {
        Intrinsics.checkParameterIsNotNull(targetBytes, "targetBytes");
        return indexOfElement(targetBytes, 0L);
    }

    @Override // okio.BufferedSource
    public boolean rangeEquals(long offset, ByteString bytes) {
        Intrinsics.checkParameterIsNotNull(bytes, "bytes");
        return rangeEquals(offset, bytes, 0, bytes.size());
    }

    @Override // okio.BufferedSource
    public boolean rangeEquals(long offset, ByteString bytes, int bytesOffset, int byteCount) {
        Intrinsics.checkParameterIsNotNull(bytes, "bytes");
        if (offset < 0 || bytesOffset < 0 || byteCount < 0 || this.size - offset < byteCount || bytes.size() - bytesOffset < byteCount) {
            return false;
        }
        for (int i = 0; i < byteCount; i++) {
            if (getByte(i + offset) != bytes.getByte(bytesOffset + i)) {
                return false;
            }
        }
        return true;
    }

    private final boolean rangeEquals(Segment segment, int segmentPos, byte[] bytes, int bytesOffset, int bytesLimit) {
        int i = segment.limit;
        byte[] bArr = segment.data;
        while (bytesOffset < bytesLimit) {
            if (segmentPos == i) {
                segment = segment.next;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                byte[] bArr2 = segment.data;
                bArr = bArr2;
                segmentPos = segment.pos;
                i = segment.limit;
            }
            if (bArr[segmentPos] != bytes[bytesOffset]) {
                return false;
            }
            segmentPos++;
            bytesOffset++;
        }
        return true;
    }

    @Override // okio.Source
    /* renamed from: timeout */
    public Timeout getThis$0() {
        return Timeout.NONE;
    }

    public final ByteString md5() {
        return digest("MD5");
    }

    public final ByteString sha1() {
        return digest("SHA-1");
    }

    public final ByteString sha256() {
        return digest("SHA-256");
    }

    public final ByteString sha512() {
        return digest("SHA-512");
    }

    private final ByteString digest(String algorithm) {
        MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
        Segment segment = this.head;
        if (segment != null) {
            messageDigest.update(segment.data, segment.pos, segment.limit - segment.pos);
            Segment segment2 = segment.next;
            if (segment2 == null) {
                Intrinsics.throwNpe();
            }
            while (segment2 != segment) {
                messageDigest.update(segment2.data, segment2.pos, segment2.limit - segment2.pos);
                segment2 = segment2.next;
                if (segment2 == null) {
                    Intrinsics.throwNpe();
                }
            }
        }
        byte[] digest = messageDigest.digest();
        Intrinsics.checkExpressionValueIsNotNull(digest, "messageDigest.digest()");
        return new ByteString(digest);
    }

    public final ByteString hmacSha1(ByteString key) {
        Intrinsics.checkParameterIsNotNull(key, "key");
        return hmac("HmacSHA1", key);
    }

    public final ByteString hmacSha256(ByteString key) {
        Intrinsics.checkParameterIsNotNull(key, "key");
        return hmac("HmacSHA256", key);
    }

    public final ByteString hmacSha512(ByteString key) {
        Intrinsics.checkParameterIsNotNull(key, "key");
        return hmac("HmacSHA512", key);
    }

    private final ByteString hmac(String algorithm, ByteString key) {
        try {
            Mac mac = Mac.getInstance(algorithm);
            mac.init(new SecretKeySpec(key.internalArray$jvm(), algorithm));
            Segment segment = this.head;
            if (segment != null) {
                mac.update(segment.data, segment.pos, segment.limit - segment.pos);
                Segment segment2 = segment.next;
                if (segment2 == null) {
                    Intrinsics.throwNpe();
                }
                while (segment2 != segment) {
                    mac.update(segment2.data, segment2.pos, segment2.limit - segment2.pos);
                    segment2 = segment2.next;
                    if (segment2 == null) {
                        Intrinsics.throwNpe();
                    }
                }
            }
            byte[] doFinal = mac.doFinal();
            Intrinsics.checkExpressionValueIsNotNull(doFinal, "mac.doFinal()");
            return new ByteString(doFinal);
        } catch (InvalidKeyException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Buffer)) {
            return false;
        }
        long j = this.size;
        Buffer buffer = (Buffer) other;
        if (j != buffer.size) {
            return false;
        }
        if (j == 0) {
            return true;
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        Segment segment2 = buffer.head;
        if (segment2 == null) {
            Intrinsics.throwNpe();
        }
        int i = segment.pos;
        Segment segment3 = segment2;
        int i2 = segment2.pos;
        int i3 = i;
        Segment segment4 = segment;
        long j2 = 0;
        while (j2 < this.size) {
            long min = Math.min(segment4.limit - i3, segment3.limit - i2);
            long j3 = 0;
            while (j3 < min) {
                int i4 = i3 + 1;
                int i5 = i2 + 1;
                if (segment4.data[i3] != segment3.data[i2]) {
                    return false;
                }
                j3++;
                i3 = i4;
                i2 = i5;
            }
            if (i3 == segment4.limit) {
                segment4 = segment4.next;
                if (segment4 == null) {
                    Intrinsics.throwNpe();
                }
                i3 = segment4.pos;
            }
            if (i2 == segment3.limit) {
                segment3 = segment3.next;
                if (segment3 == null) {
                    Intrinsics.throwNpe();
                }
                i2 = segment3.pos;
            }
            j2 += min;
        }
        return true;
    }

    public int hashCode() {
        Segment segment = this.head;
        if (segment == null) {
            return 0;
        }
        int i = 1;
        do {
            int i2 = segment.limit;
            for (int i3 = segment.pos; i3 < i2; i3++) {
                i = (i * 31) + segment.data[i3];
            }
            segment = segment.next;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
        } while (segment != this.head);
        return i;
    }

    public String toString() {
        return snapshot().toString();
    }

    public Buffer clone() {
        Buffer buffer = new Buffer();
        if (this.size == 0) {
            return buffer;
        }
        Segment segment = this.head;
        if (segment == null) {
            Intrinsics.throwNpe();
        }
        buffer.head = segment.sharedCopy();
        Segment segment2 = buffer.head;
        if (segment2 == null) {
            Intrinsics.throwNpe();
        }
        Segment segment3 = buffer.head;
        segment2.prev = segment3;
        if (segment3 == null) {
            Intrinsics.throwNpe();
        }
        Segment segment4 = buffer.head;
        if (segment4 == null) {
            Intrinsics.throwNpe();
        }
        segment3.next = segment4.prev;
        Segment segment5 = this.head;
        if (segment5 == null) {
            Intrinsics.throwNpe();
        }
        for (Segment segment6 = segment5.next; segment6 != this.head; segment6 = segment6.next) {
            Segment segment7 = buffer.head;
            if (segment7 == null) {
                Intrinsics.throwNpe();
            }
            Segment segment8 = segment7.prev;
            if (segment8 == null) {
                Intrinsics.throwNpe();
            }
            if (segment6 == null) {
                Intrinsics.throwNpe();
            }
            segment8.push(segment6.sharedCopy());
        }
        buffer.size = this.size;
        return buffer;
    }

    public final ByteString snapshot() {
        if (!(this.size <= ((long) Integer.MAX_VALUE))) {
            throw new IllegalStateException(("size > Integer.MAX_VALUE: " + this.size).toString());
        }
        return snapshot((int) this.size);
    }

    public final ByteString snapshot(int byteCount) {
        return byteCount == 0 ? ByteString.EMPTY : SegmentedByteString.INSTANCE.of(this, byteCount);
    }

    public static /* bridge */ /* synthetic */ UnsafeCursor readUnsafe$default(Buffer buffer, UnsafeCursor unsafeCursor, int i, Object obj) {
        if ((i & 1) != 0) {
            unsafeCursor = new UnsafeCursor();
        }
        return buffer.readUnsafe(unsafeCursor);
    }

    public final UnsafeCursor readUnsafe(UnsafeCursor unsafeCursor) {
        Intrinsics.checkParameterIsNotNull(unsafeCursor, "unsafeCursor");
        if (!(unsafeCursor.buffer == null)) {
            throw new IllegalStateException("already attached to a buffer".toString());
        }
        unsafeCursor.buffer = this;
        unsafeCursor.readWrite = false;
        return unsafeCursor;
    }

    public static /* bridge */ /* synthetic */ UnsafeCursor readAndWriteUnsafe$default(Buffer buffer, UnsafeCursor unsafeCursor, int i, Object obj) {
        if ((i & 1) != 0) {
            unsafeCursor = new UnsafeCursor();
        }
        return buffer.readAndWriteUnsafe(unsafeCursor);
    }

    public final UnsafeCursor readAndWriteUnsafe(UnsafeCursor unsafeCursor) {
        Intrinsics.checkParameterIsNotNull(unsafeCursor, "unsafeCursor");
        if (!(unsafeCursor.buffer == null)) {
            throw new IllegalStateException("already attached to a buffer".toString());
        }
        unsafeCursor.buffer = this;
        unsafeCursor.readWrite = true;
        return unsafeCursor;
    }

    @Deprecated(level = DeprecationLevel.ERROR, message = "moved to operator function", replaceWith = @ReplaceWith(expression = "this[index]", imports = {}))
    /* renamed from: -deprecated_getByte, reason: not valid java name */
    public final byte m1149deprecated_getByte(long index) {
        return getByte(index);
    }

    @Deprecated(level = DeprecationLevel.ERROR, message = "moved to val", replaceWith = @ReplaceWith(expression = "size", imports = {}))
    /* renamed from: -deprecated_size, reason: not valid java name and from getter */
    public final long getSize() {
        return this.size;
    }

    /* compiled from: Buffer.kt */
    @Metadata(bv = {1, 0, 2}, d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010\u0010\u001a\u00020\u0011H\u0016J\u000e\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\bJ\u0006\u0010\u0014\u001a\u00020\bJ\u000e\u0010\u0015\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\nJ\u000e\u0010\u0017\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nR\u0014\u0010\u0003\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u00020\b8\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\t\u001a\u00020\n8\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u00020\f8\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u000f\u001a\u00020\b8\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lokio/Buffer$UnsafeCursor;", "Ljava/io/Closeable;", "()V", "buffer", "Lokio/Buffer;", "data", "", "end", "", "offset", "", "readWrite", "", "segment", "Lokio/Segment;", "start", "close", "", "expandBuffer", "minByteCount", "next", "resizeBuffer", "newSize", "seek", "jvm"}, k = 1, mv = {1, 1, 11})
    /* loaded from: /home/user/work/dex/classes.dex */
    public static final class UnsafeCursor implements Closeable {
        public Buffer buffer;
        public byte[] data;
        public boolean readWrite;
        private Segment segment;
        public long offset = -1;
        public int start = -1;
        public int end = -1;

        public final int next() {
            long j = this.offset;
            Buffer buffer = this.buffer;
            if (buffer == null) {
                Intrinsics.throwNpe();
            }
            if (!(j != buffer.size())) {
                throw new IllegalStateException("no more bytes".toString());
            }
            long j2 = this.offset;
            return seek(j2 == -1 ? 0L : j2 + (this.end - this.start));
        }

        public final int seek(long offset) {
            Buffer buffer = this.buffer;
            if (buffer == null) {
                throw new IllegalStateException("not attached to a buffer".toString());
            }
            if (offset < -1 || offset > buffer.size()) {
                StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
                Object[] objArr = {Long.valueOf(offset), Long.valueOf(buffer.size())};
                String format = String.format("offset=%s > size=%s", Arrays.copyOf(objArr, objArr.length));
                Intrinsics.checkExpressionValueIsNotNull(format, "java.lang.String.format(format, *args)");
                throw new ArrayIndexOutOfBoundsException(format);
            }
            if (offset == -1 || offset == buffer.size()) {
                this.segment = (Segment) null;
                this.offset = offset;
                this.data = (byte[]) null;
                this.start = -1;
                this.end = -1;
                return -1;
            }
            long j = 0;
            long size = buffer.size();
            Segment segment = buffer.head;
            Segment segment2 = buffer.head;
            Segment segment3 = this.segment;
            if (segment3 != null) {
                long j2 = this.offset;
                int i = this.start;
                if (segment3 == null) {
                    Intrinsics.throwNpe();
                }
                long j3 = j2 - (i - segment3.pos);
                if (j3 > offset) {
                    segment2 = this.segment;
                    size = j3;
                } else {
                    segment = this.segment;
                    j = j3;
                }
            }
            if (size - offset > offset - j) {
                while (true) {
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    if (offset < (segment.limit - segment.pos) + j) {
                        break;
                    }
                    j += segment.limit - segment.pos;
                    segment = segment.next;
                }
            } else {
                j = size;
                segment = segment2;
                while (j > offset) {
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    segment = segment.prev;
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    j -= segment.limit - segment.pos;
                }
            }
            if (this.readWrite) {
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                if (segment.shared) {
                    Segment unsharedCopy = segment.unsharedCopy();
                    if (buffer.head == segment) {
                        buffer.head = unsharedCopy;
                    }
                    segment = segment.push(unsharedCopy);
                    Segment segment4 = segment.prev;
                    if (segment4 == null) {
                        Intrinsics.throwNpe();
                    }
                    segment4.pop();
                }
            }
            this.segment = segment;
            this.offset = offset;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            this.data = segment.data;
            this.start = segment.pos + ((int) (offset - j));
            this.end = segment.limit;
            return this.end - this.start;
        }

        public final long resizeBuffer(long newSize) {
            Buffer buffer = this.buffer;
            if (buffer == null) {
                throw new IllegalStateException("not attached to a buffer".toString());
            }
            if (!this.readWrite) {
                throw new IllegalStateException("resizeBuffer() only permitted for read/write buffers".toString());
            }
            long size = buffer.size();
            int i = 1;
            if (newSize <= size) {
                if (!(newSize >= 0)) {
                    throw new IllegalArgumentException(("newSize < 0: " + newSize).toString());
                }
                long j = size - newSize;
                while (true) {
                    if (j > 0) {
                        Segment segment = buffer.head;
                        if (segment == null) {
                            Intrinsics.throwNpe();
                        }
                        Segment segment2 = segment.prev;
                        if (segment2 == null) {
                            Intrinsics.throwNpe();
                        }
                        long j2 = segment2.limit - segment2.pos;
                        if (j2 <= j) {
                            buffer.head = segment2.pop();
                            SegmentPool.recycle(segment2);
                            j -= j2;
                        } else {
                            segment2.limit -= (int) j;
                            break;
                        }
                    } else {
                        break;
                    }
                }
                this.segment = (Segment) null;
                this.offset = newSize;
                this.data = (byte[]) null;
                this.start = -1;
                this.end = -1;
            } else if (newSize > size) {
                long j3 = newSize - size;
                boolean z = true;
                while (j3 > 0) {
                    Segment writableSegment$jvm = buffer.writableSegment$jvm(i);
                    int min = (int) Math.min(j3, 8192 - writableSegment$jvm.limit);
                    writableSegment$jvm.limit += min;
                    j3 -= min;
                    if (z) {
                        this.segment = writableSegment$jvm;
                        this.offset = size;
                        this.data = writableSegment$jvm.data;
                        this.start = writableSegment$jvm.limit - min;
                        this.end = writableSegment$jvm.limit;
                        z = false;
                    }
                    i = 1;
                }
            }
            buffer.setSize$jvm(newSize);
            return size;
        }

        public final long expandBuffer(int minByteCount) {
            if (!(minByteCount > 0)) {
                throw new IllegalArgumentException(("minByteCount <= 0: " + minByteCount).toString());
            }
            if (!(minByteCount <= 8192)) {
                throw new IllegalArgumentException(("minByteCount > Segment.SIZE: " + minByteCount).toString());
            }
            Buffer buffer = this.buffer;
            if (buffer == null) {
                throw new IllegalStateException("not attached to a buffer".toString());
            }
            if (!this.readWrite) {
                throw new IllegalStateException("expandBuffer() only permitted for read/write buffers".toString());
            }
            long size = buffer.size();
            Segment writableSegment$jvm = buffer.writableSegment$jvm(minByteCount);
            int i = 8192 - writableSegment$jvm.limit;
            writableSegment$jvm.limit = 8192;
            long j = i;
            buffer.setSize$jvm(size + j);
            this.segment = writableSegment$jvm;
            this.offset = size;
            this.data = writableSegment$jvm.data;
            this.start = 8192 - i;
            this.end = 8192;
            return j;
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            if (!(this.buffer != null)) {
                throw new IllegalStateException("not attached to a buffer".toString());
            }
            this.buffer = (Buffer) null;
            this.segment = (Segment) null;
            this.offset = -1L;
            this.data = (byte[]) null;
            this.start = -1;
            this.end = -1;
        }
    }

    static {
        byte[] bytes = "0123456789abcdef".getBytes(Charsets.UTF_8);
        Intrinsics.checkExpressionValueIsNotNull(bytes, "(this as java.lang.String).getBytes(charset)");
        DIGITS = bytes;
    }

    @Override // okio.BufferedSource
    public long indexOfElement(ByteString targetBytes, long fromIndex) {
        int i;
        int i2;
        Intrinsics.checkParameterIsNotNull(targetBytes, "targetBytes");
        long j = 0;
        if (!(fromIndex >= 0)) {
            throw new IllegalArgumentException(("fromIndex < 0: " + fromIndex).toString());
        }
        Segment segment = this.head;
        if (segment == null) {
            return -1L;
        }
        if (size() - fromIndex < fromIndex) {
            j = size();
            while (j > fromIndex) {
                segment = segment.prev;
                if (segment == null) {
                    Intrinsics.throwNpe();
                }
                j -= segment.limit - segment.pos;
            }
            if (segment != null) {
                if (targetBytes.size() == 2) {
                    byte b = targetBytes.getByte(0);
                    byte b2 = targetBytes.getByte(1);
                    while (j < this.size) {
                        byte[] bArr = segment.data;
                        i = (int) ((segment.pos + fromIndex) - j);
                        int i3 = segment.limit;
                        while (i < i3) {
                            byte b3 = bArr[i];
                            if (b3 != b && b3 != b2) {
                                i++;
                            }
                            i2 = segment.pos;
                        }
                        fromIndex = (segment.limit - segment.pos) + j;
                        segment = segment.next;
                        if (segment == null) {
                            Intrinsics.throwNpe();
                        }
                        j = fromIndex;
                    }
                } else {
                    byte[] internalArray$jvm = targetBytes.internalArray$jvm();
                    while (j < this.size) {
                        byte[] bArr2 = segment.data;
                        i = (int) ((segment.pos + fromIndex) - j);
                        int i4 = segment.limit;
                        while (i < i4) {
                            byte b4 = bArr2[i];
                            for (byte b5 : internalArray$jvm) {
                                if (b4 == b5) {
                                    i2 = segment.pos;
                                }
                            }
                            i++;
                        }
                        fromIndex = (segment.limit - segment.pos) + j;
                        segment = segment.next;
                        if (segment == null) {
                            Intrinsics.throwNpe();
                        }
                        j = fromIndex;
                    }
                }
            }
            return -1L;
        }
        while (true) {
            long j2 = (segment.limit - segment.pos) + j;
            if (j2 > fromIndex) {
                break;
            }
            segment = segment.next;
            if (segment == null) {
                Intrinsics.throwNpe();
            }
            j = j2;
        }
        if (segment != null) {
            if (targetBytes.size() == 2) {
                byte b6 = targetBytes.getByte(0);
                byte b7 = targetBytes.getByte(1);
                while (j < this.size) {
                    byte[] bArr3 = segment.data;
                    i = (int) ((segment.pos + fromIndex) - j);
                    int i5 = segment.limit;
                    while (i < i5) {
                        byte b8 = bArr3[i];
                        if (b8 != b6 && b8 != b7) {
                            i++;
                        }
                        i2 = segment.pos;
                    }
                    fromIndex = (segment.limit - segment.pos) + j;
                    segment = segment.next;
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    j = fromIndex;
                }
            } else {
                byte[] internalArray$jvm2 = targetBytes.internalArray$jvm();
                while (j < this.size) {
                    byte[] bArr4 = segment.data;
                    i = (int) ((segment.pos + fromIndex) - j);
                    int i6 = segment.limit;
                    while (i < i6) {
                        byte b9 = bArr4[i];
                        for (byte b10 : internalArray$jvm2) {
                            if (b9 == b10) {
                                i2 = segment.pos;
                            }
                        }
                        i++;
                    }
                    fromIndex = (segment.limit - segment.pos) + j;
                    segment = segment.next;
                    if (segment == null) {
                        Intrinsics.throwNpe();
                    }
                    j = fromIndex;
                }
            }
        }
        return -1L;
        return (i - i2) + j;
    }
}
