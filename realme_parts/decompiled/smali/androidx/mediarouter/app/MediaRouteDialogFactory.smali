.class public Landroidx/mediarouter/app/MediaRouteDialogFactory;
.super Ljava/lang/Object;
.source "MediaRouteDialogFactory.java"


# static fields
.field private static final sDefault:Landroidx/mediarouter/app/MediaRouteDialogFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/mediarouter/app/MediaRouteDialogFactory;

    invoke-direct {v0}, Landroidx/mediarouter/app/MediaRouteDialogFactory;-><init>()V

    sput-object v0, Landroidx/mediarouter/app/MediaRouteDialogFactory;->sDefault:Landroidx/mediarouter/app/MediaRouteDialogFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefault()Landroidx/mediarouter/app/MediaRouteDialogFactory;
    .locals 1

    .line 1
    sget-object v0, Landroidx/mediarouter/app/MediaRouteDialogFactory;->sDefault:Landroidx/mediarouter/app/MediaRouteDialogFactory;

    return-object v0
.end method
