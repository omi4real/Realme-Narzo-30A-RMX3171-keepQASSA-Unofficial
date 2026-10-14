.class public Lcom/realmeparts/RefreshRateTileService;
.super Landroid/service/quicksettings/TileService;
.source "RefreshRateTileService.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x18
.end annotation


# instance fields
.field private enabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/service/quicksettings/TileService;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    return-void
.end method


# virtual methods
.method public GetSmoothDisplay()Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "refresh_rate_90Forced"

    const/4 v1, 0x0

    .line 2
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public onClick()V
    .locals 11

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    .line 2
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 3
    invoke-static {p0}, Lcom/realmeparts/RefreshRateSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    .line 4
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v1

    invoke-virtual {v1}, Landroid/service/quicksettings/Tile;->getLabel()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "Refresh Rate"

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v1, v2, :cond_0

    invoke-static {p0}, Lcom/realmeparts/RefreshRateSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    :goto_0
    const-string v5, "Smooth Display"

    const-string v6, "refresh_rate_90Forced"

    if-eqz v1, :cond_1

    .line 5
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 6
    invoke-static {v4}, Lcom/realmeparts/RefreshRateSwitch;->setForcedRefreshRate(I)V

    .line 7
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v6, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_3

    :cond_1
    const/4 v1, -0x1

    .line 8
    invoke-static {v1}, Lcom/realmeparts/RefreshRateSwitch;->setForcedRefreshRate(I)V

    .line 9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v6, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 10
    iget-boolean v1, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    invoke-static {p0, v1}, Lcom/realmeparts/RefreshRateSwitch;->setPeakRefresh(Landroid/content/Context;Z)V

    .line 11
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v7, "PEAK_REFRESH_RATE"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    iget-boolean v8, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    const/high16 v9, 0x42700000    # 60.0f

    const/high16 v10, 0x42b40000    # 90.0f

    if-eqz v8, :cond_2

    move v8, v9

    goto :goto_1

    :cond_2
    move v8, v10

    :goto_1
    invoke-static {v1, v7, v8}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 12
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v7, "MIN_REFRESH_RATE"

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    iget-boolean v8, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    if-eqz v8, :cond_3

    goto :goto_2

    :cond_3
    move v9, v10

    :goto_2
    invoke-static {v1, v7, v9}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 13
    :goto_3
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v1

    invoke-interface {v0, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_4

    move-object v2, v5

    :cond_4
    invoke-virtual {v1, v2}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 14
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v1

    .line 15
    invoke-interface {v0, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_5

    const v2, 0x7f07016b

    goto :goto_4

    :cond_5
    iget-boolean v2, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    if-eqz v2, :cond_6

    const v2, 0x7f070127

    goto :goto_4

    :cond_6
    const v2, 0x7f070128

    .line 16
    :goto_4
    invoke-static {p0, v2}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/service/quicksettings/Tile;->setIcon(Landroid/graphics/drawable/Icon;)V

    .line 17
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v1

    invoke-interface {v0, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_8

    :cond_7
    move v3, v2

    goto :goto_5

    :cond_8
    iget-boolean v0, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    if-eqz v0, :cond_7

    :goto_5
    invoke-virtual {v1, v3}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 18
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
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    .line 2
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "refresh_rate_90_device"

    const/4 v2, 0x0

    .line 3
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 5
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10028f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 6
    :cond_0
    invoke-static {p0}, Lcom/realmeparts/RefreshRateSwitch;->isCurrentlyEnabled(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    .line 7
    invoke-static {p0, v0}, Lcom/realmeparts/RefreshRateSwitch;->setPeakRefresh(Landroid/content/Context;Z)V

    .line 8
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/realmeparts/RefreshRateTileService;->GetSmoothDisplay()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f07016b

    goto :goto_0

    :cond_1
    iget-boolean v1, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    if-eqz v1, :cond_2

    const v1, 0x7f070128

    goto :goto_0

    :cond_2
    const v1, 0x7f070127

    .line 10
    :goto_0
    invoke-static {p0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/service/quicksettings/Tile;->setIcon(Landroid/graphics/drawable/Icon;)V

    .line 11
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    invoke-virtual {p0}, Lcom/realmeparts/RefreshRateTileService;->GetSmoothDisplay()Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    iget-boolean v1, p0, Lcom/realmeparts/RefreshRateTileService;->enabled:Z

    if-eqz v1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x1

    :goto_1
    invoke-virtual {v0, v2}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 12
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    invoke-virtual {p0}, Lcom/realmeparts/RefreshRateTileService;->GetSmoothDisplay()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "Smooth Display"

    goto :goto_2

    :cond_5
    const-string v1, "Refresh Rate"

    :goto_2
    invoke-virtual {v0, v1}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 13
    :goto_3
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
