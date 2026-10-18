package com.yftech.upgrade.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.lang.reflect.Type;

/* loaded from: /home/user/work/dex/classes.dex */
public class JsonHelper {
    public static Gson createGson() {
        return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").setPrettyPrinting().create();
    }

    public static String toJson(Object obj) {
        return createGson().toJson(obj);
    }

    public static String toJson(Object obj, Type type) {
        return createGson().toJson(obj, type);
    }

    public static <T> T fromJson(String str, Class<T> cls) {
        return (T) createGson().fromJson(str, (Class) cls);
    }

    public static <T> T fromJson(String str, Type type) {
        return (T) fromJson(createGson(), str, type);
    }

    public static <T> T fromJson(Gson gson, String str, Type type) {
        return (T) gson.fromJson(str, type);
    }
}
