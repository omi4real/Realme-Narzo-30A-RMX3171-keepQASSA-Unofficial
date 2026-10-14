.class public Lcom/realmeparts/GameModeSwitch;
.super Ljava/lang/Object;
.source "GameModeSwitch.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final FILE:Ljava/lang/String; = "/proc/touchpanel/game_switch_enable"

.field private static final GameMode:Z = false

.field public static final GameMode_Notification_Channel_ID:I = 0x11011

.field private static mContext:Landroid/content/Context;

.field private static mNotificationManager:Landroid/app/NotificationManager;

.field private static userSelectedDndMode:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sput-object p1, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    .line 3
    const-class p0, Landroid/app/NotificationManager;

    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    invoke-virtual {p0}, Landroid/app/NotificationManager;->getCurrentInterruptionFilter()I

    move-result p0

    sput p0, Lcom/realmeparts/GameModeSwitch;->userSelectedDndMode:I

    return-void
.end method

.method public static GameModeDND()V
    .locals 6

    .line 1
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "dnd"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_dnd_enabled

    return-void

    :cond_dnd_enabled
    sget-object v1, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/realmeparts/GameModeSwitch;->checkNotificationPolicy(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.NOTIFICATION_POLICY_ACCESS_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4
    sget-object v1, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 5
    :cond_0
    sget-object v1, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    const v2, 0x11011

    const/4 v3, 0x0

    const-string v4, "dnd"

    if-eqz v1, :cond_2

    .line 6
    sget-object v1, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    const-class v5, Landroid/app/NotificationManager;

    invoke-virtual {v1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    invoke-virtual {v1}, Landroid/app/NotificationManager;->getCurrentInterruptionFilter()I

    move-result v1

    sput v1, Lcom/realmeparts/GameModeSwitch;->userSelectedDndMode:I

    .line 7
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->activateDND()V

    .line 8
    :cond_1
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    const v1, 0x7f10015c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    const v4, 0x7f10015a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v1, v3}, Lcom/realmeparts/AppNotification;->Send(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->ShowToast()V

    goto :goto_0

    .line 10
    :cond_2
    sget-object v1, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 11
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 12
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mNotificationManager:Landroid/app/NotificationManager;

    sget v1, Lcom/realmeparts/GameModeSwitch;->userSelectedDndMode:I

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->setInterruptionFilter(I)V

    .line 13
    :cond_3
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {v0, v2}, Lcom/realmeparts/AppNotification;->Cancel(Landroid/content/Context;I)V

    .line 14
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->ShowToast()V

    :cond_4
    :goto_0
    return-void
.end method

.method public static ShowToast()V
    .locals 3

    .line 1
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    const-string v2, "GameMode is activated. "

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 3
    :cond_0
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    const-string v2, "GameMode is deactivated. "

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method

.method public static activateDND()V
    .locals 4

    .line 1
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mNotificationManager:Landroid/app/NotificationManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->setInterruptionFilter(I)V

    .line 2
    sget-object v0, Lcom/realmeparts/GameModeSwitch;->mNotificationManager:Landroid/app/NotificationManager;

    new-instance v1, Landroid/app/NotificationManager$Policy;

    const/16 v2, 0x40

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v3}, Landroid/app/NotificationManager$Policy;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->setNotificationPolicy(Landroid/app/NotificationManager$Policy;)V

    return-void
.end method

.method public static checkNotificationPolicy(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/realmeparts/GameModeSwitch;->mContext:Landroid/content/Context;

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    sput-object p0, Lcom/realmeparts/GameModeSwitch;->mNotificationManager:Landroid/app/NotificationManager;

    .line 2
    invoke-virtual {p0}, Landroid/app/NotificationManager;->isNotificationPolicyAccessGranted()Z

    move-result p0

    return p0
.end method

.method public static getFile()Ljava/lang/String;
    .locals 2

    const-string v0, "/proc/touchpanel/game_switch_enable"

    .line 1
    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static isCurrentlyEnabled(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->getFileValueAsBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    check-cast p2, Ljava/lang/Boolean;

    .line 2
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const-string v0, "1"

    const-string v1, "0"

    if-eqz p1, :cond_0

    move-object p1, v0

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    invoke-static {p0, p1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    move-object p0, v1

    goto :goto_1

    :cond_1
    move-object p0, v0

    :goto_1
    const-string p1, "/proc/touchpanel/oppo_tp_limit_enable"

    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_2

    move-object p0, v0

    goto :goto_2

    :cond_2
    move-object p0, v1

    :goto_2
    const-string p1, "/proc/touchpanel/oppo_tp_direction"

    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_3

    :cond_3
    move-object v0, v1

    :goto_3
    const-string p0, "perf_profile"

    invoke-static {p0, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z
    move-result p0
    invoke-static {p0}, Lcom/realmeparts/GameModeSwitch;->applyPerformanceMode(Z)V

    .line 6
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->GameModeDND()V

    const/4 p0, 0x1

    return p0
.end method

.method public static applyPerformanceMode(Z)V
    .locals 2

    const-string v0, "1"
    const-string v1, "0"

    if-eqz p0, :cond_0

    const-string p0, "/sys/module/ged/parameters/gx_game_mode"
    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/sys/module/ged/parameters/gx_force_cpu_boost"
    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/cpufreq/cpufreq_power_mode"
    const-string v1, "3"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/cpufreq/cpufreq_cci_mode"
    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/gpufreq/gpufreq_opp_freq"
    const-string v1, "823000"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/ppm/enabled"
    const-string v1, "0"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "perf_profile"
    invoke-static {p0, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p0, "/sys/module/ged/parameters/gx_game_mode"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/sys/module/ged/parameters/gx_force_cpu_boost"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/cpufreq/cpufreq_power_mode"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/cpufreq/cpufreq_cci_mode"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/gpufreq/gpufreq_opp_freq"
    invoke-static {p0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "/proc/ppm/enabled"
    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "perf_profile"
    invoke-static {p0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
