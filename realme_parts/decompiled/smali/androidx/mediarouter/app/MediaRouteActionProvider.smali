.class public Landroidx/mediarouter/app/MediaRouteActionProvider;
.super Landroidx/core/view/ActionProvider;
.source "MediaRouteActionProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/mediarouter/app/MediaRouteActionProvider$MediaRouterCallback;
    }
.end annotation


# instance fields
.field private mButton:Landroidx/mediarouter/app/MediaRouteButton;

.field private mDialogFactory:Landroidx/mediarouter/app/MediaRouteDialogFactory;

.field private final mRouter:Landroidx/mediarouter/media/MediaRouter;

.field private mSelector:Landroidx/mediarouter/media/MediaRouteSelector;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/core/view/ActionProvider;-><init>(Landroid/content/Context;)V

    .line 2
    sget-object v0, Landroidx/mediarouter/media/MediaRouteSelector;->EMPTY:Landroidx/mediarouter/media/MediaRouteSelector;

    iput-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mSelector:Landroidx/mediarouter/media/MediaRouteSelector;

    .line 3
    invoke-static {}, Landroidx/mediarouter/app/MediaRouteDialogFactory;->getDefault()Landroidx/mediarouter/app/MediaRouteDialogFactory;

    move-result-object v0

    iput-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mDialogFactory:Landroidx/mediarouter/app/MediaRouteDialogFactory;

    .line 4
    invoke-static {p1}, Landroidx/mediarouter/media/MediaRouter;->getInstance(Landroid/content/Context;)Landroidx/mediarouter/media/MediaRouter;

    move-result-object p1

    iput-object p1, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mRouter:Landroidx/mediarouter/media/MediaRouter;

    .line 5
    new-instance p1, Landroidx/mediarouter/app/MediaRouteActionProvider$MediaRouterCallback;

    invoke-direct {p1, p0}, Landroidx/mediarouter/app/MediaRouteActionProvider$MediaRouterCallback;-><init>(Landroidx/mediarouter/app/MediaRouteActionProvider;)V

    return-void
.end method


# virtual methods
.method public isVisible()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mRouter:Landroidx/mediarouter/media/MediaRouter;

    iget-object p0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mSelector:Landroidx/mediarouter/media/MediaRouteSelector;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Landroidx/mediarouter/media/MediaRouter;->isRouteAvailable(Landroidx/mediarouter/media/MediaRouteSelector;I)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public onCreateActionView()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    if-eqz v0, :cond_0

    const-string v0, "MRActionProvider"

    const-string v1, "onCreateActionView: this ActionProvider is already associated with a menu item. Don\'t reuse MediaRouteActionProvider instances! Abandoning the old menu item..."

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_0
    new-instance v0, Landroidx/mediarouter/app/MediaRouteButton;

    invoke-virtual {p0}, Landroidx/core/view/ActionProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/mediarouter/app/MediaRouteButton;-><init>(Landroid/content/Context;)V

    .line 4
    iput-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    const/4 v1, 0x1

    .line 5
    invoke-virtual {v0, v1}, Landroidx/mediarouter/app/MediaRouteButton;->setCheatSheetEnabled(Z)V

    .line 6
    iget-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    iget-object v1, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mSelector:Landroidx/mediarouter/media/MediaRouteSelector;

    invoke-virtual {v0, v1}, Landroidx/mediarouter/app/MediaRouteButton;->setRouteSelector(Landroidx/mediarouter/media/MediaRouteSelector;)V

    .line 7
    iget-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/mediarouter/app/MediaRouteButton;->setAlwaysVisible(Z)V

    .line 8
    iget-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    iget-object v1, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mDialogFactory:Landroidx/mediarouter/app/MediaRouteDialogFactory;

    invoke-virtual {v0, v1}, Landroidx/mediarouter/app/MediaRouteButton;->setDialogFactory(Landroidx/mediarouter/app/MediaRouteDialogFactory;)V

    .line 9
    iget-object v0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    iget-object p0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    return-object p0
.end method

.method public onPerformDefaultAction()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/mediarouter/app/MediaRouteActionProvider;->mButton:Landroidx/mediarouter/app/MediaRouteButton;

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/mediarouter/app/MediaRouteButton;->showDialog()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public overridesItemVisibility()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
