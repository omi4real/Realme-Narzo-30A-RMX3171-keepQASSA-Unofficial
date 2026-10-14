.class Lcom/realmeparts/SmartChargingService$2;
.super Landroid/content/BroadcastReceiver;
.source "SmartChargingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/SmartChargingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/realmeparts/SmartChargingService;


# direct methods
.method constructor <init>(Lcom/realmeparts/SmartChargingService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/realmeparts/SmartChargingService;->battery_capacity:Ljava/lang/String;

    invoke-static {v0}, Lcom/realmeparts/Utils;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "DeviceSettings"

    const-string v3, "android.intent.action.ACTION_POWER_CONNECTED"

    if-ne v1, v3, :cond_1

    .line 3
    iget-object p2, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-static {p2}, Lcom/realmeparts/SmartChargingService;->access$100(Lcom/realmeparts/SmartChargingService;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 4
    new-instance p2, Landroid/content/IntentFilter;

    const-string v0, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {p2, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    iget-object v0, v0, Lcom/realmeparts/SmartChargingService;->mBatteryInfo:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0, p2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 6
    iget-object p0, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/realmeparts/SmartChargingService;->access$102(Lcom/realmeparts/SmartChargingService;Z)Z

    :cond_0
    const-string p0, "Charger/USB Connected"

    .line 7
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v1, "android.intent.action.ACTION_POWER_DISCONNECTED"

    if-ne p2, v1, :cond_4

    .line 9
    iget-object p2, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-static {p2}, Lcom/realmeparts/SmartChargingService;->access$000(Lcom/realmeparts/SmartChargingService;)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v1, "reset_stats"

    const/4 v3, 0x0

    invoke-interface {p2, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-static {p2}, Lcom/realmeparts/SmartChargingService;->access$000(Lcom/realmeparts/SmartChargingService;)Landroid/content/SharedPreferences;

    move-result-object p2

    const/16 v1, 0x5f

    const-string v4, "seek_bar"

    invoke-interface {p2, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    if-ne p2, v0, :cond_2

    .line 10
    invoke-static {}, Lcom/realmeparts/SmartChargingService;->resetStats()V

    .line 11
    :cond_2
    iget-object p2, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-static {p2}, Lcom/realmeparts/SmartChargingService;->access$100(Lcom/realmeparts/SmartChargingService;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    iget-object p2, p2, Lcom/realmeparts/SmartChargingService;->mBatteryInfo:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, p2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 13
    iget-object p0, p0, Lcom/realmeparts/SmartChargingService$2;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-static {p0, v3}, Lcom/realmeparts/SmartChargingService;->access$102(Lcom/realmeparts/SmartChargingService;Z)Z

    :cond_3
    const-string p0, "Charger/USB Disconnected"

    .line 14
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_0
    return-void
.end method
