.class public Lcom/realmeparts/RefreshRateSwitch;
.super Ljava/lang/Object;
.source "RefreshRateSwitch.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final SF:Landroid/os/IBinder;

.field public static setRefreshRate:I


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "SurfaceFlinger"

    .line 1
    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    sput-object v0, Lcom/realmeparts/RefreshRateSwitch;->SF:Landroid/os/IBinder;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/realmeparts/RefreshRateSwitch;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static isCurrentlyEnabled(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "PEAK_REFRESH_RATE"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x42b40000    # 90.0f

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result p0

    cmpl-float p0, p0, v1

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static setForcedRefreshRate(I)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    const-string v1, "android.ui.ISurfaceComposer"

    .line 2
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 3
    invoke-virtual {v0, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    :try_start_0
    sget-object p0, Lcom/realmeparts/RefreshRateSwitch;->SF:Landroid/os/IBinder;

    const/16 v1, 0x40b

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {p0, v1, v0, v2, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception p0

    :try_start_1
    const-string v1, "DeviceSettings"

    .line 6
    invoke-virtual {p0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    .line 7
    :goto_2
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 8
    throw p0
.end method

.method public static setPeakRefresh(Landroid/content/Context;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "PEAK_REFRESH_RATE"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const/high16 v2, 0x42b40000    # 90.0f

    const/high16 v3, 0x42700000    # 60.0f

    if-eqz p1, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    invoke-static {v0, v1, v4}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "MIN_REFRESH_RATE"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    invoke-static {p0, v0, v2}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    .line 1
    check-cast p2, Ljava/lang/Boolean;

    .line 2
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    sput v4, Lcom/realmeparts/RefreshRateSwitch;->setRefreshRate:I

    goto :goto_0

    .line 4
    :cond_0
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    if-ne p1, v0, :cond_1

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5
    sput v3, Lcom/realmeparts/RefreshRateSwitch;->setRefreshRate:I

    goto :goto_0

    .line 6
    :cond_1
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    if-ne p1, v0, :cond_2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 7
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 8
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 9
    sput v2, Lcom/realmeparts/RefreshRateSwitch;->setRefreshRate:I

    goto :goto_0

    .line 10
    :cond_2
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    if-ne p1, v0, :cond_3

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_3

    .line 11
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 12
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 13
    sput v1, Lcom/realmeparts/RefreshRateSwitch;->setRefreshRate:I

    .line 14
    :cond_3
    :goto_0
    sget p1, Lcom/realmeparts/RefreshRateSwitch;->setRefreshRate:I

    const-string p2, "MIN_REFRESH_RATE"

    const-string v0, "PEAK_REFRESH_RATE"

    if-eqz p1, :cond_7

    if-eq p1, v4, :cond_6

    if-eq p1, v2, :cond_5

    if-eq p1, v1, :cond_4

    goto :goto_1

    :cond_4
    const/4 p0, -0x1

    .line 15
    invoke-static {p0}, Lcom/realmeparts/RefreshRateSwitch;->setForcedRefreshRate(I)V

    goto :goto_1

    .line 16
    :cond_5
    invoke-static {v3}, Lcom/realmeparts/RefreshRateSwitch;->setForcedRefreshRate(I)V

    goto :goto_1

    .line 17
    :cond_6
    iget-object p1, p0, Lcom/realmeparts/RefreshRateSwitch;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x42b40000    # 90.0f

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 18
    iget-object p0, p0, Lcom/realmeparts/RefreshRateSwitch;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    goto :goto_1

    .line 19
    :cond_7
    iget-object p1, p0, Lcom/realmeparts/RefreshRateSwitch;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x42700000    # 60.0f

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 20
    iget-object p0, p0, Lcom/realmeparts/RefreshRateSwitch;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    :goto_1
    return v4
.end method
