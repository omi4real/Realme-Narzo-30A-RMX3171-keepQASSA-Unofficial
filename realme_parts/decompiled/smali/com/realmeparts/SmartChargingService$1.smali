.class Lcom/realmeparts/SmartChargingService$1;
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
    iput-object p1, p0, Lcom/realmeparts/SmartChargingService$1;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 17

    .line 1
    sget-object v0, Lcom/realmeparts/SmartChargingService;->battery_temperature:Ljava/lang/String;

    invoke-static {v0}, Lcom/realmeparts/Utils;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    .line 2
    sget-object v1, Lcom/realmeparts/SmartChargingService;->battery_capacity:Ljava/lang/String;

    invoke-static {v1}, Lcom/realmeparts/Utils;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 3
    sget-object v2, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    invoke-static {v2}, Lcom/realmeparts/Utils;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 4
    sget-object v3, Lcom/realmeparts/SmartChargingService;->current:Ljava/lang/String;

    invoke-static {v3}, Lcom/realmeparts/Utils;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    neg-int v3, v3

    .line 5
    sget-object v4, Lcom/realmeparts/SmartChargingService;->mmi_charging_enable:Ljava/lang/String;

    invoke-static {v4}, Lcom/realmeparts/Utils;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v5, p0

    .line 6
    iget-object v5, v5, Lcom/realmeparts/SmartChargingService$1;->this$0:Lcom/realmeparts/SmartChargingService;

    invoke-static {v5}, Lcom/realmeparts/SmartChargingService;->access$000(Lcom/realmeparts/SmartChargingService;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v6, "seek_bar"

    const/16 v7, 0x5f

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 7
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "charging_speed"

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    .line 8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Battery Temperature: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v9, ", Battery Capacity: "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, "%, \nCharging Speed: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " mA, Cool Down: "

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v7, "DeviceSettings"

    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    invoke-static {}, Lcom/realmeparts/SmartChargingService;->isCoolDownAvailable()Z

    move-result v3

    const/4 v10, 0x1

    const-string v11, "0"

    if-eqz v3, :cond_2

    if-ne v4, v10, :cond_2

    const-string v3, "\nBattery Capacity: "

    if-eqz v6, :cond_0

    if-eq v2, v6, :cond_0

    .line 10
    sget-object v2, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    if-nez v6, :cond_2

    float-to-double v12, v0

    const-wide v14, 0x4043c00000000000L    # 39.5

    cmpl-double v6, v12, v14

    const/4 v14, 0x2

    if-ltz v6, :cond_1

    if-eq v2, v14, :cond_1

    if-nez v2, :cond_1

    .line 12
    sget-object v2, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    const-string v6, "2"

    invoke-static {v2, v6}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%\nApplied cool down"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-wide v15, 0x4043400000000000L    # 38.5

    cmpg-double v6, v12, v15

    if-gtz v6, :cond_2

    if-eqz v2, :cond_2

    if-ne v2, v14, :cond_2

    .line 14
    sget-object v2, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    invoke-static {v2, v11}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%\nNo cool down applied"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    if-eq v5, v1, :cond_3

    if-ge v5, v1, :cond_5

    :cond_3
    if-eqz v4, :cond_5

    .line 16
    invoke-static {}, Lcom/realmeparts/SmartChargingService;->isCoolDownAvailable()Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v2, Lcom/realmeparts/SmartChargingService;->cool_down:Ljava/lang/String;

    invoke-static {v2, v11}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    :cond_4
    sget-object v2, Lcom/realmeparts/SmartChargingService;->mmi_charging_enable:Ljava/lang/String;

    invoke-static {v2, v11}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "%, User selected charging limit: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "%. Stopped charging"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_5
    if-le v5, v1, :cond_6

    if-eq v4, v10, :cond_6

    .line 19
    sget-object v0, Lcom/realmeparts/SmartChargingService;->mmi_charging_enable:Ljava/lang/String;

    const-string v1, "1"

    invoke-static {v0, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Charging..."

    .line 20
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    :goto_1
    return-void
.end method
