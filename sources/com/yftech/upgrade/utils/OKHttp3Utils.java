package com.yftech.upgrade.utils;

import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import okhttp3.CacheControl;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

/* loaded from: /home/user/work/dex/classes.dex */
public class OKHttp3Utils {
    private static OKHttp3Utils instance;
    private static OkHttpClient mOkHttpClient;
    private MediaType mediaType;
    private String TAG = "OKHttp3Utils";
    private final int HTTP_TIMEOUT = 10;

    public static OKHttp3Utils getInstance() {
        if (instance == null) {
            instance = new OKHttp3Utils();
        }
        return instance;
    }

    private static SSLSocketFactory createSSLSocketFactory() {
        try {
            SSLContext sSLContext = SSLContext.getInstance("TLS");
            sSLContext.init(null, new TrustManager[]{new TrustAllManager()}, new SecureRandom());
            return sSLContext.getSocketFactory();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: /home/user/work/dex/classes.dex */
    public static class TrustAllManager implements X509TrustManager {
        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            return new X509Certificate[0];
        }

        private TrustAllManager() {
        }
    }

    private OKHttp3Utils() {
        OkHttpClient.Builder hostnameVerifier = new OkHttpClient.Builder().connectTimeout(10L, TimeUnit.SECONDS).readTimeout(10L, TimeUnit.SECONDS).writeTimeout(10L, TimeUnit.SECONDS).sslSocketFactory(createSSLSocketFactory()).hostnameVerifier(new HostnameVerifier() { // from class: com.yftech.upgrade.utils.OKHttp3Utils.1
            @Override // javax.net.ssl.HostnameVerifier
            public boolean verify(String str, SSLSession sSLSession) {
                return true;
            }
        });
        this.mediaType = MediaType.parse("application/json; charset=utf-8");
        mOkHttpClient = hostnameVerifier.build();
    }

    public void getAsynHttp(String str, Callback callback) {
        OkHttpClient.Builder newBuilder = mOkHttpClient.newBuilder();
        newBuilder.connectTimeout(10L, TimeUnit.SECONDS).build();
        newBuilder.readTimeout(10L, TimeUnit.SECONDS).build();
        OkHttpClient build = newBuilder.writeTimeout(10L, TimeUnit.SECONDS).build();
        Request.Builder url = new Request.Builder().url(str);
        url.method("GET", null);
        build.newCall(url.build().newBuilder().cacheControl(CacheControl.FORCE_NETWORK).build()).enqueue(callback);
    }

    public Call postAsynHttp(String str, Callback callback, String str2, Object obj) {
        return postAsynHttp(str, callback, str2, this.mediaType, obj);
    }

    public Call postAsynHttp(String str, Callback callback, String str2, MediaType mediaType, Object obj) {
        Call newCall = mOkHttpClient.newCall(new Request.Builder().url(str).post(RequestBody.create(mediaType, str2)).tag(obj).cacheControl(CacheControl.FORCE_NETWORK).build());
        newCall.enqueue(callback);
        return newCall;
    }

    public Call downAsynFile(String str, Callback callback, long j, String str2) {
        Request.Builder builder = new Request.Builder();
        builder.tag(str2);
        if (j > 0) {
            builder.addHeader("RANGE", "bytes=" + j + "-");
        }
        Call newCall = mOkHttpClient.newCall(builder.url(str).build());
        newCall.enqueue(callback);
        return newCall;
    }

    public void cancelTag(Object obj) {
        if (obj == null) {
            return;
        }
        for (Call call : mOkHttpClient.dispatcher().queuedCalls()) {
            if (obj.equals(call.request().tag())) {
                call.cancel();
            }
        }
        for (Call call2 : mOkHttpClient.dispatcher().runningCalls()) {
            if (obj.equals(call2.request().tag())) {
                call2.cancel();
            }
        }
    }
}
