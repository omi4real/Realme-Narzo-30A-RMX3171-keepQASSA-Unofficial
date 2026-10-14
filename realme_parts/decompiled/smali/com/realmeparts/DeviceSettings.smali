.class public Lcom/realmeparts/DeviceSettings;
.super Landroidx/preference/PreferenceFragment;
.source "DeviceSettings.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field public static final CABC_SYSTEM_PROPERTY:Ljava/lang/String; = "persist.cabc_profile"

.field public static final KEY_CABC:Ljava/lang/String; = "cabc"

.field private static final KEY_CATEGORY_CHARGING:Ljava/lang/String; = "charging"

.field private static final KEY_CATEGORY_GRAPHICS:Ljava/lang/String; = "graphics"

.field private static final KEY_CATEGORY_REFRESH_RATE:Ljava/lang/String; = "refresh_rate"

.field public static final KEY_CHARGING_SPEED:Ljava/lang/String; = "charging_speed"

.field public static final KEY_CHARGING_SWITCH:Ljava/lang/String; = "smart_charging"

.field public static final KEY_DC_SWITCH:Ljava/lang/String; = "dc"

.field public static final KEY_DND_SWITCH:Ljava/lang/String; = "dnd"

.field public static final KEY_DT2W_SWITCH:Ljava/lang/String; = "dt2w"

.field public static final KEY_FPS_INFO:Ljava/lang/String; = "fps_info"

.field public static final KEY_GAME_SWITCH:Ljava/lang/String; = "game"

.field public static final KEY_HBM_SWITCH:Ljava/lang/String; = "hbm"

.field public static final KEY_OTG_SWITCH:Ljava/lang/String; = "otg"

.field public static final KEY_RESET_STATS:Ljava/lang/String; = "reset_stats"

.field public static final KEY_SETTINGS_PREFIX:Ljava/lang/String; = "device_setting_"

.field public static final KEY_SRGB_SWITCH:Ljava/lang/String; = "srgb"

.field private static final ProductName:Ljava/lang/String;

.field public static final TP_DIRECTION:Ljava/lang/String; = "/proc/touchpanel/oppo_tp_direction"

.field public static final TP_LIMIT_ENABLE:Ljava/lang/String; = "/proc/touchpanel/oppo_tp_limit_enable"

.field public static mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

.field private static mDT2WModeSwitch:Landroidx/preference/TwoStatePreference;

.field public static mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private static mNotificationManager:Landroid/app/NotificationManager;

.field public static mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

.field public static mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

.field public static mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

.field public static mResetStats:Landroidx/preference/TwoStatePreference;

.field public static mSeekBarPreference:Lcom/realmeparts/SeekBarPreference;


# instance fields
.field private CABC_DeviceMatched:Z

.field private DC_DeviceMatched:Z

.field private HBM_DeviceMatched:Z

.field private mCABC:Lcom/realmeparts/SecureSettingListPreference;

.field private mDCModeSwitch:Landroidx/preference/TwoStatePreference;

.field public mDNDSwitch:Landroidx/preference/TwoStatePreference;

.field private mFpsInfo:Landroidx/preference/SwitchPreference;

.field private mGameModeSwitch:Landroidx/preference/TwoStatePreference;

.field private mHBMModeSwitch:Landroidx/preference/TwoStatePreference;

.field private mOTGModeSwitch:Landroidx/preference/TwoStatePreference;

.field public mPreferenceCategory:Landroidx/preference/PreferenceCategory;

.field private mSRGBModeSwitch:Landroidx/preference/TwoStatePreference;

.field private mSmartChargingSwitch:Landroidx/preference/TwoStatePreference;

.field private sRGB_DeviceMatched:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/realmeparts/Utils;->ProductName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/realmeparts/DeviceSettings;->ProductName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method private DisplayRefreshRateModes()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "display"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    sput-object v1, Lcom/realmeparts/DeviceSettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    const/4 v2, 0x0

    .line 3
    invoke-virtual {v1, v2}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v1

    .line 4
    array-length v3, v1

    const-string v4, ""

    move v5, v2

    :goto_0
    if-ge v5, v3, :cond_0

    aget-object v6, v1, v5

    .line 5
    new-instance v7, Ljava/text/DecimalFormat;

    const-string v8, "0.##"

    invoke-direct {v7, v8}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    invoke-static {v4}, Lcom/android/tools/r8/GeneratedOutlineSupport;->outline2(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v6}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v6

    float-to-double v8, v6

    invoke-virtual {v7, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "Hz, "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 7
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Device supports "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "refresh rate modes"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "DeviceSettings"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "90"

    .line 8
    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v3, "refresh_rate_90_device"

    if-nez v1, :cond_1

    .line 9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "refresh_rate"

    .line 10
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    .line 11
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragment;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object p0, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_1

    .line 12
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p0, v3, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_1
    return-void
.end method

.method private ParseJson()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "graphics"

    .line 2
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/PreferenceCategory;

    iput-object v1, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    .line 3
    invoke-virtual {p0}, Landroid/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x7f0f0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/realmeparts/Utils;->InputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .line 4
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "cabc"

    .line 5
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v4, 0x0

    move v5, v4

    .line 6
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ge v5, v6, :cond_1

    .line 7
    sget-object v6, Lcom/realmeparts/DeviceSettings;->ProductName:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 8
    iput-boolean v7, p0, Lcom/realmeparts/DeviceSettings;->CABC_DeviceMatched:Z

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    const-string v3, "dc"

    .line 9
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    move v6, v4

    .line 10
    :goto_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v6, v8, :cond_3

    .line 11
    sget-object v8, Lcom/realmeparts/DeviceSettings;->ProductName:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 12
    iput-boolean v7, p0, Lcom/realmeparts/DeviceSettings;->DC_DeviceMatched:Z

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_3
    const-string v6, "hbm"

    .line 13
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    move v9, v4

    .line 14
    :goto_2
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_5

    .line 15
    sget-object v10, Lcom/realmeparts/DeviceSettings;->ProductName:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 16
    iput-boolean v7, p0, Lcom/realmeparts/DeviceSettings;->HBM_DeviceMatched:Z

    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_5
    const-string v8, "srgb"

    .line 17
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    move v9, v4

    .line 18
    :goto_3
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_7

    .line 19
    sget-object v10, Lcom/realmeparts/DeviceSettings;->ProductName:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 20
    iput-boolean v7, p0, Lcom/realmeparts/DeviceSettings;->sRGB_DeviceMatched:Z

    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 21
    :cond_7
    iget-boolean v2, p0, Lcom/realmeparts/DeviceSettings;->CABC_DeviceMatched:Z

    const-string v5, "CABC_DeviceMatched"

    if-nez v2, :cond_8

    .line 22
    iget-object v2, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 23
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_4

    .line 24
    :cond_8
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v5, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 25
    :goto_4
    iget-boolean v1, p0, Lcom/realmeparts/DeviceSettings;->DC_DeviceMatched:Z

    const-string v2, "DC_DeviceMatched"

    if-nez v1, :cond_9

    .line 26
    iget-object v1, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 27
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_5

    .line 28
    :cond_9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 29
    :goto_5
    iget-boolean v1, p0, Lcom/realmeparts/DeviceSettings;->HBM_DeviceMatched:Z

    const-string v2, "HBM_DeviceMatched"

    if-nez v1, :cond_a

    .line 30
    iget-object v1, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p0, v6}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 31
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_6

    .line 32
    :cond_a
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 33
    :goto_6
    iget-boolean v1, p0, Lcom/realmeparts/DeviceSettings;->sRGB_DeviceMatched:Z

    const-string v2, "sRGB_DeviceMatched"

    if-nez v1, :cond_b

    .line 34
    iget-object v1, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p0, v8}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 35
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_7

    .line 36
    :cond_b
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_7
    return-void
.end method

.method private isCoolDownAvailable()V
    .locals 2

    const-string v0, "charging"

    .line 1
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    .line 2
    sget-object v0, Lcom/realmeparts/SmartChargingService;->mmi_charging_enable:Ljava/lang/String;

    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    sget-object v0, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 4
    iget-object v0, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    const-string v1, "charging_speed"

    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragment;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object p0, p0, Lcom/realmeparts/DeviceSettings;->mPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 2
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    sget-object v0, Lcom/realmeparts/DeviceSettings;->ProductName:Ljava/lang/String;

    const-string v1, "ProductName"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    const p2, 0x7f130001

    .line 3
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->addPreferencesFromResource(I)V

    .line 4
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    const-string p2, "dc"

    .line 5
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Landroidx/preference/TwoStatePreference;

    iput-object p2, p0, Lcom/realmeparts/DeviceSettings;->mDCModeSwitch:Landroidx/preference/TwoStatePreference;

    .line 6
    invoke-static {}, Lcom/realmeparts/DCModeSwitch;->isSupported()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 7
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mDCModeSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/realmeparts/DCModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 8
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mDCModeSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v1, Lcom/realmeparts/DCModeSwitch;

    invoke-direct {v1}, Lcom/realmeparts/DCModeSwitch;-><init>()V

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "srgb"

    .line 9
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Landroidx/preference/TwoStatePreference;

    iput-object p2, p0, Lcom/realmeparts/DeviceSettings;->mSRGBModeSwitch:Landroidx/preference/TwoStatePreference;

    .line 10
    invoke-static {}, Lcom/realmeparts/SRGBModeSwitch;->isSupported()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 11
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mSRGBModeSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/realmeparts/SRGBModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 12
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mSRGBModeSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v1, Lcom/realmeparts/SRGBModeSwitch;

    invoke-direct {v1}, Lcom/realmeparts/SRGBModeSwitch;-><init>()V

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "hbm"

    .line 13
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Landroidx/preference/TwoStatePreference;

    iput-object p2, p0, Lcom/realmeparts/DeviceSettings;->mHBMModeSwitch:Landroidx/preference/TwoStatePreference;

    .line 14
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->isSupported()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 15
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mHBMModeSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/realmeparts/HBMModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 16
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mHBMModeSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v1, Lcom/realmeparts/HBMModeSwitch;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/realmeparts/HBMModeSwitch;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "otg"

    .line 17
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Landroidx/preference/TwoStatePreference;

    iput-object p2, p0, Lcom/realmeparts/DeviceSettings;->mOTGModeSwitch:Landroidx/preference/TwoStatePreference;

    .line 18
    invoke-static {}, Lcom/realmeparts/OTGModeSwitch;->isSupported()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 19
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mOTGModeSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/realmeparts/OTGModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 20
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mOTGModeSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v1, Lcom/realmeparts/OTGModeSwitch;

    invoke-direct {v1}, Lcom/realmeparts/OTGModeSwitch;-><init>()V

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "game"

    .line 21
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Landroidx/preference/TwoStatePreference;

    iput-object p2, p0, Lcom/realmeparts/DeviceSettings;->mGameModeSwitch:Landroidx/preference/TwoStatePreference;

    .line 22
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->isSupported()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 23
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mGameModeSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 24
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mGameModeSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v1, Lcom/realmeparts/GameModeSwitch;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/realmeparts/GameModeSwitch;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "dnd"

    .line 25
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/TwoStatePreference;

    iput-object v1, p0, Lcom/realmeparts/DeviceSettings;->mDNDSwitch:Landroidx/preference/TwoStatePreference;

    const/4 v2, 0x0

    .line 26
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-virtual {v1, p2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 27
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mDNDSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p2, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "smart_charging"

    .line 28
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/TwoStatePreference;

    iput-object v1, p0, Lcom/realmeparts/DeviceSettings;->mSmartChargingSwitch:Landroidx/preference/TwoStatePreference;

    .line 29
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-virtual {v1, p2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 30
    iget-object p2, p0, Lcom/realmeparts/DeviceSettings;->mSmartChargingSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v1, Lcom/realmeparts/SmartChargingSwitch;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/realmeparts/SmartChargingSwitch;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "charging_speed"

    .line 31
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Lcom/realmeparts/SecureSettingListPreference;

    sput-object p2, Lcom/realmeparts/DeviceSettings;->mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

    .line 32
    iget-object v1, p0, Lcom/realmeparts/DeviceSettings;->mSmartChargingSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {v1}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 33
    sget-object p2, Lcom/realmeparts/DeviceSettings;->mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {p2, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "reset_stats"

    .line 34
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/TwoStatePreference;

    sput-object v1, Lcom/realmeparts/DeviceSettings;->mResetStats:Landroidx/preference/TwoStatePreference;

    .line 35
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-virtual {v1, p2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 36
    sget-object p2, Lcom/realmeparts/DeviceSettings;->mResetStats:Landroidx/preference/TwoStatePreference;

    iget-object v1, p0, Lcom/realmeparts/DeviceSettings;->mSmartChargingSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {v1}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 37
    sget-object p2, Lcom/realmeparts/DeviceSettings;->mResetStats:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p2, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "seek_bar"

    .line 38
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/realmeparts/SeekBarPreference;

    sput-object v1, Lcom/realmeparts/DeviceSettings;->mSeekBarPreference:Lcom/realmeparts/SeekBarPreference;

    .line 39
    iget-object v3, p0, Lcom/realmeparts/DeviceSettings;->mSmartChargingSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {v3}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v3

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setEnabled(Z)V

    const/16 v1, 0x5f

    .line 40
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    sput p2, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    const-string p2, "refresh_rate_90Forced"

    .line 41
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/TwoStatePreference;

    sput-object v1, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    .line 42
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 43
    sget-object v1, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    new-instance v3, Lcom/realmeparts/RefreshRateSwitch;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/realmeparts/RefreshRateSwitch;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v1, "refresh_rate_90"

    .line 44
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/realmeparts/RadioButtonPreference;

    sput-object v3, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    .line 45
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/realmeparts/RefreshRateSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v4

    invoke-virtual {v3, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 46
    sget-object v3, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    new-instance v4, Lcom/realmeparts/RefreshRateSwitch;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/realmeparts/RefreshRateSwitch;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v3, "refresh_rate_60"

    .line 47
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/realmeparts/RadioButtonPreference;

    sput-object v4, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    .line 48
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/realmeparts/RefreshRateSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v5

    xor-int/2addr v0, v5

    invoke-virtual {v4, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 49
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    new-instance v4, Lcom/realmeparts/RefreshRateSwitch;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/realmeparts/RefreshRateSwitch;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v0, "fps_info"

    .line 50
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Landroidx/preference/SwitchPreference;

    iput-object v4, p0, Lcom/realmeparts/DeviceSettings;->mFpsInfo:Landroidx/preference/SwitchPreference;

    .line 51
    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {v4, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 52
    iget-object v0, p0, Lcom/realmeparts/DeviceSettings;->mFpsInfo:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v0, "cabc"

    .line 53
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/realmeparts/SecureSettingListPreference;

    iput-object v0, p0, Lcom/realmeparts/DeviceSettings;->mCABC:Lcom/realmeparts/SecureSettingListPreference;

    const-string v4, "persist.cabc_profile"

    const-string v5, "0"

    .line 54
    invoke-static {v4, v5}, Lcom/realmeparts/Utils;->getStringProp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/realmeparts/SecureSettingListPreference;->setValue(Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/realmeparts/DeviceSettings;->mCABC:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {v0}, Landroidx/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/realmeparts/SecureSettingListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 56
    iget-object v0, p0, Lcom/realmeparts/DeviceSettings;->mCABC:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v0, "dt2w"

    .line 57
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/TwoStatePreference;

    sput-object v0, Lcom/realmeparts/DeviceSettings;->mDT2WModeSwitch:Landroidx/preference/TwoStatePreference;

    .line 58
    invoke-static {}, Lcom/realmeparts/DT2WModeSwitch;->isSupported()Z

    move-result v4

    invoke-virtual {v0, v4}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 59
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mDT2WModeSwitch:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/realmeparts/DT2WModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v4

    invoke-virtual {v0, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 60
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mDT2WModeSwitch:Landroidx/preference/TwoStatePreference;

    new-instance v4, Lcom/realmeparts/DT2WModeSwitch;

    invoke-direct {v4}, Lcom/realmeparts/DT2WModeSwitch;-><init>()V

    invoke-virtual {v0, v4}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 61
    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 62
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 63
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    goto :goto_0

    .line 64
    :cond_0
    invoke-interface {p1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 65
    sget-object p1, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 66
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/realmeparts/DeviceSettings;->isCoolDownAvailable()V

    .line 67
    invoke-direct {p0}, Lcom/realmeparts/DeviceSettings;->DisplayRefreshRateModes()V

    .line 68
    :try_start_0
    invoke-direct {p0}, Lcom/realmeparts/DeviceSettings;->ParseJson()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DeviceSettings"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 2
    invoke-super {p0, p1}, Landroid/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p0, 0x1

    return p0
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/realmeparts/DeviceSettings;->mFpsInfo:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_1

    .line 2
    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/realmeparts/FPSInfoService;

    invoke-static {v0, v1}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/realmeparts/FPSInfoService;

    invoke-static {v0, v1}, Lcom/realmeparts/Utils;->stopService(Landroid/content/Context;Ljava/lang/Class;)V

    .line 5
    :cond_1
    :goto_0
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

    if-ne p1, v0, :cond_2

    .line 6
    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/realmeparts/SecureSettingListPreference;->setValue(Ljava/lang/String;)V

    .line 7
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mChargingSpeed:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {v0}, Landroidx/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/realmeparts/SecureSettingListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 8
    :cond_2
    iget-object v0, p0, Lcom/realmeparts/DeviceSettings;->mCABC:Lcom/realmeparts/SecureSettingListPreference;

    if-ne p1, v0, :cond_3

    .line 9
    check-cast p2, Ljava/lang/String;

    invoke-virtual {v0, p2}, Lcom/realmeparts/SecureSettingListPreference;->setValue(Ljava/lang/String;)V

    .line 10
    iget-object p0, p0, Lcom/realmeparts/DeviceSettings;->mCABC:Lcom/realmeparts/SecureSettingListPreference;

    invoke-virtual {p0}, Landroidx/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/realmeparts/SecureSettingListPreference;->setSummary(Ljava/lang/CharSequence;)V

    const-string p0, "persist.cabc_profile"

    .line 11
    invoke-static {p0, p2}, Lcom/realmeparts/Utils;->setStringProp(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public onPreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_0

    .line 2
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 3
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 4
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    return v2

    .line 5
    :cond_0
    sget-object v0, Lcom/realmeparts/DeviceSettings;->mRefreshRate60:Lcom/realmeparts/RadioButtonPreference;

    if-ne p1, v0, :cond_1

    .line 6
    invoke-virtual {v0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 7
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90:Lcom/realmeparts/RadioButtonPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 8
    sget-object p0, Lcom/realmeparts/DeviceSettings;->mRefreshRate90Forced:Landroidx/preference/TwoStatePreference;

    invoke-virtual {p0, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    return v2

    .line 9
    :cond_1
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragment;->onPreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p0

    return p0
.end method
