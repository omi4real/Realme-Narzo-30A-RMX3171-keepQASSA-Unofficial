.class public final Lcom/realmeparts/doze/DozeUtils;
.super Ljava/lang/Object;
.source "DozeUtils.java"


# direct methods
.method public static checkDozeService(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isDozeEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isAlwaysOnEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isPickUpEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isHandwaveGestureEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 3
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isPocketGestureEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    .line 4
    const-class v0, Lcom/realmeparts/doze/DozeService;

    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_2

    .line 5
    :cond_2
    const-class v0, Lcom/realmeparts/doze/DozeService;

    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->stopService(Landroid/content/Context;Ljava/lang/Class;)V

    :goto_2
    return-void
.end method

.method public static getSensor(Landroid/hardware/SensorManager;Ljava/lang/String;)Landroid/hardware/Sensor;
    .locals 2

    const/4 v0, -0x1

    .line 1
    invoke-virtual {p0, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    .line 2
    invoke-virtual {v0}, Landroid/hardware/Sensor;->getStringType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method protected static isAlwaysOnEnabled(Landroid/content/Context;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1110062

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "DOZE_ALWAYS_ON"

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 4
    new-instance v3, Landroid/hardware/display/AmbientDisplayConfiguration;

    invoke-direct {v3, p0}, Landroid/hardware/display/AmbientDisplayConfiguration;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Landroid/hardware/display/AmbientDisplayConfiguration;->alwaysOnAvailable()Z

    move-result p0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p0, :cond_0

    if-eqz v0, :cond_0

    move p0, v3

    goto :goto_0

    :cond_0
    move p0, v4

    .line 5
    :goto_0
    invoke-static {v1, v2, p0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    return v3
.end method

.method public static isDozeEnabled(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "DOZE_ENABLED"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method protected static isGestureEnabled(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method protected static isHandwaveGestureEnabled(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "gesture_hand_wave"

    .line 1
    invoke-static {p0, v0}, Lcom/realmeparts/doze/DozeUtils;->isGestureEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method protected static isPickUpEnabled(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "gesture_pick_up"

    .line 1
    invoke-static {p0, v0}, Lcom/realmeparts/doze/DozeUtils;->isGestureEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method protected static isPocketGestureEnabled(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "gesture_pocket"

    .line 1
    invoke-static {p0, v0}, Lcom/realmeparts/doze/DozeUtils;->isGestureEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method protected static wakeOrLaunchDozePulse(Landroid/content/Context;)V
    .locals 4

    const-string v0, "wake_on_gesture"

    .line 1
    invoke-static {p0, v0}, Lcom/realmeparts/doze/DozeUtils;->isGestureEnabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/PowerManager;

    .line 3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 v2, 0x4

    const-string v3, "DozeUtils"

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/os/PowerManager;->wakeUp(JILjava/lang/String;)V

    goto :goto_0

    .line 4
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.systemui.doze.pulse"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method
