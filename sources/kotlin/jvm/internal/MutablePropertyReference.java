package kotlin.jvm.internal;

import kotlin.reflect.KMutableProperty;

/* loaded from: /home/user/work/dex/classes.dex */
public abstract class MutablePropertyReference extends PropertyReference implements KMutableProperty {
    public MutablePropertyReference() {
    }

    public MutablePropertyReference(Object obj) {
        super(obj);
    }
}
