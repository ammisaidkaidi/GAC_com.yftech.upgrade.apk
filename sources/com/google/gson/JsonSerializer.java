package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: /home/user/work/dex/classes.dex */
public interface JsonSerializer<T> {
    JsonElement serialize(T t, Type type, JsonSerializationContext jsonSerializationContext);
}
