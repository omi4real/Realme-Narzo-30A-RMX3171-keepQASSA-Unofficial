.class public Lcom/realmeparts/SmartChargingService;
.super Landroid/app/Service;
.source "SmartChargingService.java"


# static fields
.field private static final Debug:Z = false

.field public static battery_capacity:Ljava/lang/String; = "/sys/class/power_supply/battery/capacity"

.field public static battery_temperature:Ljava/lang/String; = "/sys/class/power_supply/battery/temp"

.field public static cool_down:Ljava/lang/String; = "/sys/class/power_supply/battery/cool_down"

.field public static current:Ljava/lang/String; = "/sys/class/power_supply/battery/current_now"

.field public static mmi_charging_enable:Ljava/lang/String; = "/sys/class/power_supply/battery/mmi_charging_enable"

.field private static final resetBatteryStats:Z = false


# instance fields
.field public mBatteryInfo:Landroid/content/BroadcastReceiver;

.field public mconnectionInfo:Landroid/content/BroadcastReceiver;

.field private mconnectionInfoReceiver:Z

.field private sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    new-instance v0, Lcom/realmeparts/SmartChargingService$1;

    invoke-direct {v0, p0}, Lcom/realmeparts/SmartChargingService$1;-><init>(Lcom/realmeparts/SmartChargingService;)V

    iput-object v0, p0, Lcom/realmeparts/SmartChargingService;->mBatteryInfo:Landroid/content/BroadcastReceiver;

    .line 3
    new-instance v0, Lcom/realmeparts/SmartChargingService$2;

    invoke-direct {v0, p0}, Lcom/realmeparts/SmartChargingService$2;-><init>(Lcom/realmeparts/SmartChargingService;)V

    iput-object v0, p0, Lcom/realmeparts/SmartChargingService;->mconnectionInfo:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/realmeparts/SmartChargingService;)Landroid/content/SharedPreferences;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/realmeparts/SmartChargingService;->sharedPreferences:Landroid/content/SharedPreferences;

    return-object p0
.end method

.method static synthetic access$100(Lcom/realmeparts/SmartChargingService;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/realmeparts/SmartChargingService;->mconnectionInfoReceiver:Z

    return p0
.end method

.method static synthetic access$102(Lcom/realmeparts/SmartChargingService;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/realmeparts/SmartChargingService;->mconnectionInfoReceiver:Z

    return p1
.end method

.method public static isCoolDownAvailable()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static resetStats()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const-string v1, "dumpsys batterystats --reset"

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    const-wide/16 v0, 0x3e8

    .line 2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "SmartChargingService: "

    .line 3
    invoke-static {v1}, Lcom/android/tools/r8/GeneratedOutlineSupport;->outline2(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DeviceSettings"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/realmeparts/SmartChargingService;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 3
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.ACTION_POWER_CONNECTED"

    .line 4
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.ACTION_POWER_DISCONNECTED"

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 6
    iget-object v1, p0, Lcom/realmeparts/SmartChargingService;->mconnectionInfo:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Landroid/app/Service;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 2
    iget-object v0, p0, Lcom/realmeparts/SmartChargingService;->mconnectionInfo:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Landroid/app/Service;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 3
    iget-boolean v0, p0, Lcom/realmeparts/SmartChargingService;->mconnectionInfoReceiver:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lcom/realmeparts/SmartChargingService;->mBatteryInfo:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    return-void
.end method
