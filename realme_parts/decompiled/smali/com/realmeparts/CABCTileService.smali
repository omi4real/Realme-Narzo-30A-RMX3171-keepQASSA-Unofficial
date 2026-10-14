.class public Lcom/realmeparts/CABCTileService;
.super Landroid/service/quicksettings/TileService;
.source "CABCTileService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/service/quicksettings/TileService;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 4

    const-string v0, "persist.cabc_profile"

    const/4 v1, 0x0

    .line 1
    invoke-static {v0, v1}, Lcom/realmeparts/Utils;->getintProp(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 v1, v2, 0x1

    .line 2
    :goto_0
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v2

    .line 3
    invoke-static {v0, v1}, Lcom/realmeparts/Utils;->setintProp(Ljava/lang/String;I)V

    .line 4
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f020026

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {v2, v0}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 5
    invoke-virtual {v2}, Landroid/service/quicksettings/Tile;->updateTile()V

    .line 6
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    return-void
.end method

.method public onStartListening()V
    .locals 5

    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "persist.cabc_profile"

    const/4 v2, 0x0

    .line 2
    invoke-static {v1, v2}, Lcom/realmeparts/Utils;->getintProp(Ljava/lang/String;I)I

    move-result v1

    .line 3
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v3

    const-string v4, "CABC_DeviceMatched"

    .line 4
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    invoke-virtual {v3, v2}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 6
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10028f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    .line 7
    invoke-virtual {v3, v0}, Landroid/service/quicksettings/Tile;->setState(I)V

    .line 8
    invoke-virtual {p0}, Landroid/service/quicksettings/TileService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f020026

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {v3, v0}, Landroid/service/quicksettings/Tile;->setLabel(Ljava/lang/CharSequence;)V

    .line 9
    :goto_0
    invoke-virtual {v3}, Landroid/service/quicksettings/Tile;->updateTile()V

    .line 10
    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    return-void
.end method
