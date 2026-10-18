package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: /home/user/work/dex/classes.dex */
public interface InstanceCreator<T> {
    T createInstance(Type type);
}
