package com.google.gson;

import com.google.gson.reflect.TypeToken;

/* loaded from: /home/user/work/dex/classes.dex */
public interface TypeAdapterFactory {
    <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken);
}
