package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: /home/user/work/dex/classes.dex */
public interface JsonDeserializer<T> {
    T deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException;
}
