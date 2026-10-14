.class public final Landroidx/core/graphics/ColorUtils;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# static fields
.field private static final TEMP_ARRAY:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[D>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroidx/core/graphics/ColorUtils;->TEMP_ARRAY:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static calculateContrast(II)D
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_1

    .line 2
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 3
    invoke-static {p0, p1}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result p0

    .line 4
    :cond_0
    invoke-static {p0}, Landroidx/core/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide v0

    const-wide v2, 0x3fa999999999999aL    # 0.05

    add-double/2addr v0, v2

    .line 5
    invoke-static {p1}, Landroidx/core/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide p0

    add-double/2addr p0, v2

    .line 6
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->min(DD)D

    move-result-wide p0

    div-double/2addr v2, p0

    return-wide v2

    .line 7
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "background can not be translucent: #"

    invoke-static {v0}, Lcom/android/tools/r8/GeneratedOutlineSupport;->outline2(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static calculateLuminance(I)D
    .locals 18

    .line 1
    sget-object v0, Landroidx/core/graphics/ColorUtils;->TEMP_ARRAY:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x3

    if-nez v0, :cond_0

    new-array v0, v1, [D

    .line 2
    sget-object v2, Landroidx/core/graphics/ColorUtils;->TEMP_ARRAY:Ljava/lang/ThreadLocal;

    invoke-virtual {v2, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 3
    :cond_0
    invoke-static/range {p0 .. p0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static/range {p0 .. p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static/range {p0 .. p0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    .line 4
    array-length v5, v0

    if-ne v5, v1, :cond_4

    int-to-double v1, v2

    const-wide v5, 0x406fe00000000000L    # 255.0

    div-double/2addr v1, v5

    const-wide v7, 0x3fa4b5dcc63f1412L    # 0.04045

    cmpg-double v9, v1, v7

    const-wide v10, 0x4029d70a3d70a3d7L    # 12.92

    const-wide v12, 0x3fac28f5c28f5c29L    # 0.055

    const-wide v14, 0x3ff0e147ae147ae1L    # 1.055

    const-wide v7, 0x4003333333333333L    # 2.4

    if-gez v9, :cond_1

    div-double/2addr v1, v10

    goto :goto_0

    :cond_1
    add-double/2addr v1, v12

    div-double/2addr v1, v14

    .line 5
    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    :goto_0
    int-to-double v7, v3

    div-double/2addr v7, v5

    const-wide v16, 0x3fa4b5dcc63f1412L    # 0.04045

    cmpg-double v3, v7, v16

    if-gez v3, :cond_2

    div-double/2addr v7, v10

    const-wide v14, 0x4003333333333333L    # 2.4

    goto :goto_1

    :cond_2
    add-double/2addr v7, v12

    div-double/2addr v7, v14

    const-wide v14, 0x4003333333333333L    # 2.4

    .line 6
    invoke-static {v7, v8, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    :goto_1
    int-to-double v3, v4

    div-double/2addr v3, v5

    cmpg-double v5, v3, v16

    if-gez v5, :cond_3

    div-double/2addr v3, v10

    goto :goto_2

    :cond_3
    add-double/2addr v3, v12

    const-wide v5, 0x3ff0e147ae147ae1L    # 1.055

    div-double/2addr v3, v5

    .line 7
    invoke-static {v3, v4, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    :goto_2
    const/4 v5, 0x0

    const-wide v9, 0x3fda64c2f837b4a2L    # 0.4124

    mul-double/2addr v9, v1

    const-wide v11, 0x3fd6e2eb1c432ca5L    # 0.3576

    mul-double/2addr v11, v7

    add-double/2addr v11, v9

    const-wide v9, 0x3fc71a9fbe76c8b4L    # 0.1805

    mul-double/2addr v9, v3

    add-double/2addr v9, v11

    const-wide/high16 v11, 0x4059000000000000L    # 100.0

    mul-double/2addr v9, v11

    .line 8
    aput-wide v9, v0, v5

    const-wide v5, 0x3fcb367a0f9096bcL    # 0.2126

    mul-double/2addr v5, v1

    const-wide v9, 0x3fe6e2eb1c432ca5L    # 0.7152

    mul-double/2addr v9, v7

    add-double/2addr v9, v5

    const-wide v5, 0x3fb27bb2fec56d5dL    # 0.0722

    mul-double/2addr v5, v3

    add-double/2addr v5, v9

    mul-double/2addr v5, v11

    const/4 v9, 0x1

    .line 9
    aput-wide v5, v0, v9

    const/4 v5, 0x2

    const-wide v13, 0x3f93c36113404ea5L    # 0.0193

    mul-double/2addr v1, v13

    const-wide v13, 0x3fbe83e425aee632L    # 0.1192

    mul-double/2addr v7, v13

    add-double/2addr v7, v1

    const-wide v1, 0x3fee6a7ef9db22d1L    # 0.9505

    mul-double/2addr v3, v1

    add-double/2addr v3, v7

    mul-double/2addr v3, v11

    .line 10
    aput-wide v3, v0, v5

    .line 11
    aget-wide v0, v0, v9

    div-double/2addr v0, v11

    return-wide v0

    .line 12
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "outXyz must have a length of 3."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static circularInterpolate(FFF)F
    .locals 2

    sub-float v0, p1, p0

    .line 1
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v0, v0, v1

    const/high16 v1, 0x43b40000    # 360.0f

    if-lez v0, :cond_1

    cmpl-float v0, p1, p0

    if-lez v0, :cond_0

    add-float/2addr p0, v1

    goto :goto_0

    :cond_0
    add-float/2addr p1, v1

    :cond_1
    :goto_0
    sub-float/2addr p1, p0

    mul-float/2addr p1, p2

    add-float/2addr p1, p0

    rem-float/2addr p1, v1

    return p1
.end method

.method public static compositeColors(II)I
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    .line 2
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    rsub-int v2, v0, 0xff

    rsub-int v3, v1, 0xff

    mul-int/2addr v3, v2

    .line 3
    div-int/lit16 v3, v3, 0xff

    rsub-int v2, v3, 0xff

    .line 4
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v3

    .line 5
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    .line 6
    invoke-static {v3, v1, v4, v0, v2}, Landroidx/core/graphics/ColorUtils;->compositeComponent(IIIII)I

    move-result v3

    .line 7
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    .line 8
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    .line 9
    invoke-static {v4, v1, v5, v0, v2}, Landroidx/core/graphics/ColorUtils;->compositeComponent(IIIII)I

    move-result v4

    .line 10
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    .line 11
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    .line 12
    invoke-static {p0, v1, p1, v0, v2}, Landroidx/core/graphics/ColorUtils;->compositeComponent(IIIII)I

    move-result p0

    .line 13
    invoke-static {v2, v3, v4, p0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method private static compositeComponent(IIIII)I
    .locals 0

    if-nez p4, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    mul-int/lit16 p0, p0, 0xff

    mul-int/2addr p0, p1

    mul-int/2addr p2, p3

    rsub-int p1, p1, 0xff

    mul-int/2addr p1, p2

    add-int/2addr p1, p0

    mul-int/lit16 p4, p4, 0xff

    .line 1
    div-int/2addr p1, p4

    return p1
.end method

.method public static setAlphaComponent(II)I
    .locals 1

    if-ltz p1, :cond_0

    const/16 v0, 0xff

    if-gt p1, v0, :cond_0

    const v0, 0xffffff

    and-int/2addr p0, v0

    shl-int/lit8 p1, p1, 0x18

    or-int/2addr p0, p1

    return p0

    .line 1
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "alpha must be between 0 and 255."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
