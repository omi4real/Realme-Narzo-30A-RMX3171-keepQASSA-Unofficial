.class public final synthetic Landroidx/mediarouter/media/-$$Lambda$zMyvfVxKhaSv8GFN-7x4sfyRIzM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/function/Function;


# static fields
.field public static final synthetic INSTANCE:Landroidx/mediarouter/media/-$$Lambda$zMyvfVxKhaSv8GFN-7x4sfyRIzM;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/mediarouter/media/-$$Lambda$zMyvfVxKhaSv8GFN-7x4sfyRIzM;

    invoke-direct {v0}, Landroidx/mediarouter/media/-$$Lambda$zMyvfVxKhaSv8GFN-7x4sfyRIzM;-><init>()V

    sput-object v0, Landroidx/mediarouter/media/-$$Lambda$zMyvfVxKhaSv8GFN-7x4sfyRIzM;->INSTANCE:Landroidx/mediarouter/media/-$$Lambda$zMyvfVxKhaSv8GFN-7x4sfyRIzM;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    check-cast p1, Ljava/lang/String;

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p0

    const v0, -0x7b1e3633

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq p0, v0, :cond_2

    const v0, 0x3909bb2a

    if-eq p0, v0, :cond_1

    const v0, 0x3a2c33cf    # 6.5689994E-4f

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p0, "android.media.intent.category.LIVE_VIDEO"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    move p0, v2

    goto :goto_1

    :cond_1
    const-string p0, "android.media.intent.category.LIVE_AUDIO"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    const-string p0, "android.media.intent.category.REMOTE_PLAYBACK"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    move p0, v1

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p0, -0x1

    :goto_1
    if-eqz p0, :cond_6

    if-eq p0, v2, :cond_5

    if-eq p0, v1, :cond_4

    goto :goto_2

    :cond_4
    const-string p1, "android.media.route.feature.REMOTE_PLAYBACK"

    goto :goto_2

    :cond_5
    const-string p1, "android.media.route.feature.LIVE_VIDEO"

    goto :goto_2

    :cond_6
    const-string p1, "android.media.route.feature.LIVE_AUDIO"

    :goto_2
    return-object p1
.end method
