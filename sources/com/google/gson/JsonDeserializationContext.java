package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: /home/user/work/dex/classes.dex */
public interface JsonDeserializationContext {
    <T> T deserialize(JsonElement jsonElement, Type type) throws JsonParseException;
}
