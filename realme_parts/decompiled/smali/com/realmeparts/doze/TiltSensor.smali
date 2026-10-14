.class public Lcom/realmeparts/doze/TiltSensor;
.super Ljava/lang/Object;
.source "TiltSensor.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mEntryTimestamp:J

.field private final mExecutorService:Ljava/util/concurrent/ExecutorService;

.field private final mSensor:Landroid/hardware/Sensor;

.field private final mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/realmeparts/doze/TiltSensor;->mContext:Landroid/content/Context;

    .line 3
    const-class v0, Landroid/hardware/SensorManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/realmeparts/doze/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    const-string v0, "android.sensor.tilt_detector"

    .line 4
    invoke-static {p1, v0}, Lcom/realmeparts/doze/DozeUtils;->getSensor(Landroid/hardware/SensorManager;Ljava/lang/String;)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/realmeparts/doze/TiltSensor;->mSensor:Landroid/hardware/Sensor;

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    iput-object p1, p0, Lcom/realmeparts/doze/TiltSensor;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method protected disable()V
    .locals 1

    .line 1
    new-instance v0, Lcom/realmeparts/doze/-$$Lambda$TiltSensor$SvrSTb7g-FXi8FmpPf5DURcNGPE;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/-$$Lambda$TiltSensor$SvrSTb7g-FXi8FmpPf5DURcNGPE;-><init>(Lcom/realmeparts/doze/TiltSensor;)V

    .line 2
    iget-object p0, p0, Lcom/realmeparts/doze/TiltSensor;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method protected enable()V
    .locals 1

    .line 1
    new-instance v0, Lcom/realmeparts/doze/-$$Lambda$TiltSensor$-YcG8PFPkoWk2rbWzV7oajCZzXQ;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/-$$Lambda$TiltSensor$-YcG8PFPkoWk2rbWzV7oajCZzXQ;-><init>(Lcom/realmeparts/doze/TiltSensor;)V

    .line 2
    iget-object p0, p0, Lcom/realmeparts/doze/TiltSensor;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public synthetic lambda$disable$1$TiltSensor()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/realmeparts/doze/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/realmeparts/doze/TiltSensor;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    return-void
.end method

.method public synthetic lambda$enable$0$TiltSensor()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/realmeparts/doze/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/realmeparts/doze/TiltSensor;->mSensor:Landroid/hardware/Sensor;

    const/4 v2, 0x3

    const v3, 0x186a0

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;II)Z

    .line 2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/realmeparts/doze/TiltSensor;->mEntryTimestamp:J

    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/realmeparts/doze/TiltSensor;->mEntryTimestamp:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x9c4

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/realmeparts/doze/TiltSensor;->mEntryTimestamp:J

    .line 3
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v0, 0x0

    aget p1, p1, v0

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1

    .line 4
    iget-object p0, p0, Lcom/realmeparts/doze/TiltSensor;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->wakeOrLaunchDozePulse(Landroid/content/Context;)V

    :cond_1
    return-void
.end method
