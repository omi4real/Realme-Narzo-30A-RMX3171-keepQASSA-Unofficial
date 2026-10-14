.class public Lcom/realmeparts/SmartChargingSwitch;
.super Ljava/lang/Object;
.source "SmartChargingSwitch.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final FILE:Ljava/lang/String; = "/sys/class/power_supply/battery/mmi_charging_enable"

.field private static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sput-object p1, Lcom/realmeparts/SmartChargingSwitch;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static getFile()Ljava/lang/String;
    .locals 2

    const-string v0, "/sys/class/power_supply/battery/mmi_charging_enable"

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
    invoke-static {}, Lcom/realmeparts/SmartChargingSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->getFileValueAsBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/realmeparts/SmartChargingSwitch;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Boolean;

    .line 2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_0

    .line 3
    sget-object p0, Lcom/realmeparts/SmartChargingSwitch;->mContext:Landroid/content/Context;

    const-class p2, Lcom/realmeparts/SmartChargingService;

    invoke-static {p0, p2}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V

    .line 4
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mSeekBarPreference:Lcom/realmeparts/SeekBarPreference;

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 5
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mResetStats:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 6
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    goto :goto_0

    .line 7
    :cond_0
    sget-object p0, Lcom/realmeparts/SmartChargingSwitch;->mContext:Landroid/content/Context;

    const-class p2, Lcom/realmeparts/SmartChargingService;

    invoke-static {p0, p2}, Lcom/realmeparts/Utils;->stopService(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mSeekBarPreference:Lcom/realmeparts/SeekBarPreference;

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 9
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mResetStats:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 10
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    const-string p0, "/sys/class/power_supply/battery/mmi_charging_enable"

    const-string p2, "1"

    .line 11
    invoke-static {p0, p2}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return p1
.end method
