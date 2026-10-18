.class public interface abstract annotation Lcom/yftech/upgrade/data/TaskState$ENUM_DEVICE_ID;
.super Ljava/lang/Object;
.source "TaskState.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yftech/upgrade/data/TaskState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "ENUM_DEVICE_ID"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final MCU:I = 0x2

.field public static final OS:I = 0x1

.field public static final UNKNOWN:I = -0x1
