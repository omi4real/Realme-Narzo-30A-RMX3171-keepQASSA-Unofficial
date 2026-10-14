.class public Lcom/realmeparts/doze/ProximitySensor;
.super Ljava/lang/Object;
.source "ProximitySensor.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mExecutorService:Ljava/util/concurrent/ExecutorService;

.field private mInPocketTime:J

.field private mSawNear:Z

.field private final mSensor:Landroid/hardware/Sensor;

.field private final mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/realmeparts/doze/ProximitySensor;->mSawNear:Z

    const-wide/16 v0, 0x0

    .line 3
    iput-wide v0, p0, Lcom/realmeparts/doze/ProximitySensor;->mInPocketTime:J

    .line 4
    iput-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mContext:Landroid/content/Context;

    .line 5
    const-class v0, Landroid/hardware/SensorManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensorManager:Landroid/hardware/SensorManager;

    const-string v0, "android.sensor.proximity"

    .line 6
    invoke-static {p1, v0}, Lcom/realmeparts/doze/DozeUtils;->getSensor(Landroid/hardware/SensorManager;Ljava/lang/String;)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensor:Landroid/hardware/Sensor;

    .line 7
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    iput-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method protected disable()V
    .locals 1

    .line 1
    new-instance v0, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$4fb1BvBvPC0_JiP1BR9v3IXW-kI;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$4fb1BvBvPC0_JiP1BR9v3IXW-kI;-><init>(Lcom/realmeparts/doze/ProximitySensor;)V

    .line 2
    iget-object p0, p0, Lcom/realmeparts/doze/ProximitySensor;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method protected enable()V
    .locals 1

    .line 1
    new-instance v0, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$oXw6SA7rr6klItIH_TNqOPJQX9c;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$oXw6SA7rr6klItIH_TNqOPJQX9c;-><init>(Lcom/realmeparts/doze/ProximitySensor;)V

    .line 2
    iget-object p0, p0, Lcom/realmeparts/doze/ProximitySensor;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public synthetic lambda$disable$1$ProximitySensor()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    return-void
.end method

.method public synthetic lambda$enable$0$ProximitySensor()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensor:Landroid/hardware/Sensor;

    const/4 v2, 0x3

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7

    .line 1
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Lcom/realmeparts/doze/ProximitySensor;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v2

    cmpg-float v0, v0, v2

    const/4 v2, 0x1

    if-gez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 2
    :goto_0
    iget-boolean v3, p0, Lcom/realmeparts/doze/ProximitySensor;->mSawNear:Z

    if-eqz v3, :cond_4

    if-nez v0, :cond_4

    .line 3
    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    .line 4
    iget-wide v5, p0, Lcom/realmeparts/doze/ProximitySensor;->mInPocketTime:J

    sub-long/2addr v3, v5

    .line 5
    iget-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->isHandwaveGestureEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->isPocketGestureEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    .line 6
    :cond_1
    iget-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->isHandwaveGestureEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-wide/32 v5, 0x3b9aca00

    cmp-long p1, v3, v5

    if-gez p1, :cond_3

    :goto_1
    move v1, v2

    goto :goto_2

    .line 7
    :cond_2
    iget-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->isPocketGestureEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-wide/32 v5, 0x77359400

    cmp-long p1, v3, v5

    if-ltz p1, :cond_3

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v1, :cond_5

    .line 8
    iget-object p1, p0, Lcom/realmeparts/doze/ProximitySensor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->wakeOrLaunchDozePulse(Landroid/content/Context;)V

    goto :goto_3

    .line 9
    :cond_4
    iget-wide v1, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iput-wide v1, p0, Lcom/realmeparts/doze/ProximitySensor;->mInPocketTime:J

    .line 10
    :cond_5
    :goto_3
    iput-boolean v0, p0, Lcom/realmeparts/doze/ProximitySensor;->mSawNear:Z

    return-void
.end method
