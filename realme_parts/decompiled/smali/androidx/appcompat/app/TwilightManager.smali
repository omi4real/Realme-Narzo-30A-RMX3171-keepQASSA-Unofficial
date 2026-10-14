.class Landroidx/appcompat/app/TwilightManager;
.super Ljava/lang/Object;
.source "TwilightManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/TwilightManager$TwilightState;
    }
.end annotation


# static fields
.field private static sInstance:Landroidx/appcompat/app/TwilightManager;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mLocationManager:Landroid/location/LocationManager;

.field private final mTwilightState:Landroidx/appcompat/app/TwilightManager$TwilightState;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/location/LocationManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroidx/appcompat/app/TwilightManager$TwilightState;

    invoke-direct {v0}, Landroidx/appcompat/app/TwilightManager$TwilightState;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/app/TwilightManager;->mTwilightState:Landroidx/appcompat/app/TwilightManager$TwilightState;

    .line 3
    iput-object p1, p0, Landroidx/appcompat/app/TwilightManager;->mContext:Landroid/content/Context;

    .line 4
    iput-object p2, p0, Landroidx/appcompat/app/TwilightManager;->mLocationManager:Landroid/location/LocationManager;

    return-void
.end method

.method static getInstance(Landroid/content/Context;)Landroidx/appcompat/app/TwilightManager;
    .locals 2

    .line 1
    sget-object v0, Landroidx/appcompat/app/TwilightManager;->sInstance:Landroidx/appcompat/app/TwilightManager;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 3
    new-instance v0, Landroidx/appcompat/app/TwilightManager;

    const-string v1, "location"

    .line 4
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    invoke-direct {v0, p0, v1}, Landroidx/appcompat/app/TwilightManager;-><init>(Landroid/content/Context;Landroid/location/LocationManager;)V

    sput-object v0, Landroidx/appcompat/app/TwilightManager;->sInstance:Landroidx/appcompat/app/TwilightManager;

    .line 5
    :cond_0
    sget-object p0, Landroidx/appcompat/app/TwilightManager;->sInstance:Landroidx/appcompat/app/TwilightManager;

    return-object p0
.end method

.method private getLastKnownLocationForProvider(Ljava/lang/String;)Landroid/location/Location;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Landroidx/appcompat/app/TwilightManager;->mLocationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, p1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Landroidx/appcompat/app/TwilightManager;->mLocationManager:Landroid/location/LocationManager;

    invoke-virtual {p0, p1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "TwilightManager"

    const-string v0, "Failed to get last known location"

    .line 3
    invoke-static {p1, v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static setInstance(Landroidx/appcompat/app/TwilightManager;)V
    .locals 0

    .line 1
    sput-object p0, Landroidx/appcompat/app/TwilightManager;->sInstance:Landroidx/appcompat/app/TwilightManager;

    return-void
.end method


# virtual methods
.method isNight()Z
    .locals 21

    move-object/from16 v0, p0

    .line 1
    iget-object v1, v0, Landroidx/appcompat/app/TwilightManager;->mTwilightState:Landroidx/appcompat/app/TwilightManager$TwilightState;

    .line 2
    iget-wide v2, v1, Landroidx/appcompat/app/TwilightManager$TwilightState;->nextUpdate:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-lez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    if-eqz v2, :cond_1

    .line 3
    iget-boolean v0, v1, Landroidx/appcompat/app/TwilightManager$TwilightState;->isNight:Z

    return v0

    .line 4
    :cond_1
    iget-object v2, v0, Landroidx/appcompat/app/TwilightManager;->mContext:Landroid/content/Context;

    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v2, v5}, Landroidx/core/app/ActivityManagerCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    const/4 v5, 0x0

    if-nez v2, :cond_2

    const-string v2, "network"

    .line 5
    invoke-direct {v0, v2}, Landroidx/appcompat/app/TwilightManager;->getLastKnownLocationForProvider(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v2, v5

    .line 6
    :goto_1
    iget-object v6, v0, Landroidx/appcompat/app/TwilightManager;->mContext:Landroid/content/Context;

    const-string v7, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v6, v7}, Landroidx/core/app/ActivityManagerCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_3

    const-string v5, "gps"

    .line 7
    invoke-direct {v0, v5}, Landroidx/appcompat/app/TwilightManager;->getLastKnownLocationForProvider(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v5

    :cond_3
    if-eqz v5, :cond_4

    if-eqz v2, :cond_4

    .line 8
    invoke-virtual {v5}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    invoke-virtual {v2}, Landroid/location/Location;->getTime()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_5

    :goto_2
    move-object v2, v5

    goto :goto_3

    :cond_4
    if-eqz v5, :cond_5

    goto :goto_2

    :cond_5
    :goto_3
    if-eqz v2, :cond_b

    .line 9
    iget-object v0, v0, Landroidx/appcompat/app/TwilightManager;->mTwilightState:Landroidx/appcompat/app/TwilightManager$TwilightState;

    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 11
    invoke-static {}, Landroidx/appcompat/app/TwilightCalculator;->getInstance()Landroidx/appcompat/app/TwilightCalculator;

    move-result-object v14

    const-wide/32 v15, 0x5265c00

    sub-long v6, v12, v15

    .line 12
    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v8

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v10

    move-object v5, v14

    .line 13
    invoke-virtual/range {v5 .. v11}, Landroidx/appcompat/app/TwilightCalculator;->calculateTwilight(JDD)V

    .line 14
    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v8

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v10

    move-wide v6, v12

    invoke-virtual/range {v5 .. v11}, Landroidx/appcompat/app/TwilightCalculator;->calculateTwilight(JDD)V

    .line 15
    iget v5, v14, Landroidx/appcompat/app/TwilightCalculator;->state:I

    if-ne v5, v3, :cond_6

    goto :goto_4

    :cond_6
    move v3, v4

    .line 16
    :goto_4
    iget-wide v10, v14, Landroidx/appcompat/app/TwilightCalculator;->sunrise:J

    .line 17
    iget-wide v8, v14, Landroidx/appcompat/app/TwilightCalculator;->sunset:J

    add-long v6, v12, v15

    .line 18
    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v15

    invoke-virtual {v2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v17

    move-object v5, v14

    move-wide/from16 v19, v8

    move-wide v8, v15

    move-wide v15, v10

    move-wide/from16 v10, v17

    .line 19
    invoke-virtual/range {v5 .. v11}, Landroidx/appcompat/app/TwilightCalculator;->calculateTwilight(JDD)V

    .line 20
    iget-wide v4, v14, Landroidx/appcompat/app/TwilightCalculator;->sunrise:J

    const-wide/16 v6, 0x0

    const-wide/16 v8, -0x1

    cmp-long v2, v15, v8

    if-eqz v2, :cond_a

    cmp-long v2, v19, v8

    if-nez v2, :cond_7

    goto :goto_6

    :cond_7
    cmp-long v2, v12, v19

    if-lez v2, :cond_8

    add-long/2addr v4, v6

    goto :goto_5

    :cond_8
    cmp-long v2, v12, v15

    if-lez v2, :cond_9

    add-long v4, v19, v6

    goto :goto_5

    :cond_9
    add-long v4, v15, v6

    :goto_5
    const-wide/32 v6, 0xea60

    add-long/2addr v4, v6

    goto :goto_7

    :cond_a
    :goto_6
    const-wide/32 v4, 0x2932e00

    add-long/2addr v4, v12

    .line 21
    :goto_7
    iput-boolean v3, v0, Landroidx/appcompat/app/TwilightManager$TwilightState;->isNight:Z

    .line 22
    iput-wide v4, v0, Landroidx/appcompat/app/TwilightManager$TwilightState;->nextUpdate:J

    .line 23
    iget-boolean v0, v1, Landroidx/appcompat/app/TwilightManager$TwilightState;->isNight:Z

    return v0

    :cond_b
    const-string v0, "TwilightManager"

    const-string v1, "Could not get last known location. This is probably because the app does not have any location permissions. Falling back to hardcoded sunrise/sunset values."

    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/16 v1, 0xb

    .line 26
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    const/4 v1, 0x6

    if-lt v0, v1, :cond_d

    const/16 v1, 0x16

    if-lt v0, v1, :cond_c

    goto :goto_8

    :cond_c
    move v3, v4

    :cond_d
    :goto_8
    return v3
.end method
