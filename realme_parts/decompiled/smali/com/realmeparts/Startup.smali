.class public Lcom/realmeparts/Startup;
.super Landroid/content/BroadcastReceiver;
.source "Startup.java"


# static fields
.field private static final ONE_TIME_TUNABLE_RESTORE:Ljava/lang/String; = "hardware_tunable_restored"

.field private static final TAG:Ljava/lang/String; = "BootReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private hasRestoredTunable(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, "hardware_tunable_restored"

    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private restore(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {p1, p2}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private restore(Ljava/lang/String;Z)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    const-string p0, "1"

    .line 1
    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private setRestoredTunable(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 2
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "hardware_tunable_restored"

    const/4 v0, 0x1

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->checkDozeService(Landroid/content/Context;)V

    .line 2
    invoke-static {p1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v0, "dc"

    const/4 v1, 0x0

    .line 3
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 4
    invoke-static {}, Lcom/realmeparts/DCModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/realmeparts/Startup;->restore(Ljava/lang/String;Z)V

    const-string v0, "srgb"

    .line 5
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 6
    invoke-static {}, Lcom/realmeparts/SRGBModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/realmeparts/Startup;->restore(Ljava/lang/String;Z)V

    const-string v0, "otg"

    .line 7
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 8
    invoke-static {}, Lcom/realmeparts/OTGModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/realmeparts/Startup;->restore(Ljava/lang/String;Z)V

    const-string v0, "game"

    .line 9
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 10
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/realmeparts/Startup;->restore(Ljava/lang/String;Z)V

    invoke-static {v0}, Lcom/realmeparts/GameModeSwitch;->applyPerformanceMode(Z)V

    const-string v0, "hbm"

    .line 11
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 12
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v2}, Lcom/realmeparts/Startup;->restore(Ljava/lang/String;Z)V

    const-string v2, "dt2w"

    .line 13
    invoke-interface {p2, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 14
    invoke-static {}, Lcom/realmeparts/DT2WModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v2}, Lcom/realmeparts/Startup;->restore(Ljava/lang/String;Z)V

    const-string p0, "smart_charging"

    .line 15
    invoke-interface {p2, p0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 16
    const-class p0, Lcom/realmeparts/SmartChargingService;

    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V

    :cond_0
    const-string p0, "fps_info"

    .line 17
    invoke-interface {p2, p0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 18
:try_start_fps
    const-class p0, Lcom/realmeparts/FPSInfoService;
    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V
    :try_end_fps
    .catch Ljava/lang/Exception; {:try_start_fps .. :try_end_fps} :catch_fps

    :catch_fps

    :cond_1
    const-string p0, "refresh_rate_90Forced"

    .line 19
    invoke-interface {p2, p0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 20
    invoke-static {v1}, Lcom/realmeparts/RefreshRateSwitch;->setForcedRefreshRate(I)V

    .line 21
    :cond_2
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 22
    const-class p0, Lcom/realmeparts/HBMService;

    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V

    :cond_3
    return-void
.end method
