.class public final synthetic Landroidx/mediarouter/media/-$$Lambda$RegisteredMediaRouteProviderWatcher$krXCgEIuDNaJnjux21SSYdM7sUw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Function;


# static fields
.field public static final synthetic INSTANCE:Landroidx/mediarouter/media/-$$Lambda$RegisteredMediaRouteProviderWatcher$krXCgEIuDNaJnjux21SSYdM7sUw;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/mediarouter/media/-$$Lambda$RegisteredMediaRouteProviderWatcher$krXCgEIuDNaJnjux21SSYdM7sUw;

    invoke-direct {v0}, Landroidx/mediarouter/media/-$$Lambda$RegisteredMediaRouteProviderWatcher$krXCgEIuDNaJnjux21SSYdM7sUw;-><init>()V

    sput-object v0, Landroidx/mediarouter/media/-$$Lambda$RegisteredMediaRouteProviderWatcher$krXCgEIuDNaJnjux21SSYdM7sUw;->INSTANCE:Landroidx/mediarouter/media/-$$Lambda$RegisteredMediaRouteProviderWatcher$krXCgEIuDNaJnjux21SSYdM7sUw;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Landroid/content/pm/ResolveInfo;

    .line 1
    iget-object p0, p1, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    return-object p0
.end method
