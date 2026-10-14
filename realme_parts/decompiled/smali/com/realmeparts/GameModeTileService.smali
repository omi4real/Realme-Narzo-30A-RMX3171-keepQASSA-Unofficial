.class public Lcom/realmeparts/GameModeTileService;
.super Landroid/service/quicksettings/TileService;
.source "GameModeTileService.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x18
.end annotation


# instance fields
.field private enabled:Z

.field private mContext:Landroid/content/Context;

.field private mNotificationManager:Landroid/app/NotificationManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/service/quicksettings/TileService;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    return-void
.end method

.method private GameModeTileDND()V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/realmeparts/GameModeTileService;->mNotificationManager:Landroid/app/NotificationManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->setInterruptionFilter(I)V

    .line 3
    iget-object p0, p0, Lcom/realmeparts/GameModeTileService;->mNotificationManager:Landroid/app/NotificationManager;

    new-instance v0, Landroid/app/NotificationManager$Policy;

    const/16 v1, 0x40

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Landroid/app/NotificationManager$Policy;-><init>(III)V

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->setNotificationPolicy(Landroid/app/NotificationManager$Policy;)V

    goto :goto_0

    .line 4
    :cond_1
    iget-object p0, p0, Lcom/realmeparts/GameModeTileService;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {p0, v1}, Landroid/app/NotificationManager;->setInterruptionFilter(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    const-string v0, "notification"

    .line 2
    invoke-virtual {p0, v0}, Landroid/service/quicksettings/TileService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/realmeparts/GameModeTileService;->mNotificationManager:Landroid/app/NotificationManager;

    .line 3
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 4
    invoke-static {p0}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    const v2, 0x11011

    if-nez v1, :cond_0

    const v1, 0x7f10015c

    .line 5
    invoke-virtual {p0, v1}, Landroid/service/quicksettings/TileService;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f10015a

    invoke-virtual {p0, v3}, Landroid/service/quicksettings/TileService;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v2, v1, v3}, Lcom/realmeparts/AppNotification;->Send(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p0, v2}, Lcom/realmeparts/AppNotification;->Cancel(Landroid/content/Context;I)V

    .line 7
    :goto_0
    invoke-static {}, Lcom/realmeparts/GameModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    const-string v3, "0"

    const-string v4, "1"

    if-eqz v2, :cond_1

    move-object v2, v3

    goto :goto_1

    :cond_1
    move-object v2, v4

    :goto_1
    invoke-static {v1, v2}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    if-eqz v1, :cond_2

    move-object v1, v4

    goto :goto_2

    :cond_2
    move-object v1, v3

    :goto_2
    const-string v2, "/proc/touchpanel/oppo_tp_limit_enable"

    invoke-static {v2, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    if-eqz v1, :cond_3

    move-object v1, v3

    goto :goto_3

    :cond_3
    move-object v1, v4

    :goto_3
    const-string v2, "/proc/touchpanel/oppo_tp_direction"

    invoke-static {v2, v1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    if-eqz v1, :cond_4

    goto :goto_4

    :cond_4
    move-object v3, v4

    :goto_4
    const-string v1, "perf_profile"

    invoke-static {v1, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z
    if-nez v1, :cond_perf_on
    const/4 v1, 0x1
    invoke-static {v1}, Lcom/realmeparts/GameModeSwitch;->applyPerformanceMode(Z)V
    goto :cond_perf_done
    :cond_perf_on
    const/4 v1, 0x0
    invoke-static {v1}, Lcom/realmeparts/GameModeSwitch;->applyPerformanceMode(Z)V
    :cond_perf_done

    const/4 v1, 0x0

    const-string v2, "dnd"

    .line 11
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-direct {p0}, Lcom/realmeparts/GameModeTileService;->GameModeTileDND()V

    .line 12
    :cond_5
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    const-string v3, "game"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 13
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    if-eqz v1, :cond_6

    goto :goto_5

    :cond_6
    const/4 v2, 0x2

    :goto_5
    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 14
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object p0

    invoke-virtual {p0}, Landroid/service/quicksettings/Tile;->updateTile()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onDestroy()V

    return-void
.end method

.method public onStartListening()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    .line 2
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 3
    invoke-static {p0}, Lcom/realmeparts/GameModeSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    .line 4
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    iget-boolean v1, p0, Lcom/realmeparts/GameModeTileService;->enabled:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 5
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object p0

    invoke-virtual {p0}, Landroid/service/quicksettings/Tile;->updateTile()V

    return-void
.end method

.method public onStopListening()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStopListening()V

    return-void
.end method

.method public onTileAdded()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onTileAdded()V

    return-void
.end method

.method public onTileRemoved()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onTileRemoved()V

    return-void
.end method
