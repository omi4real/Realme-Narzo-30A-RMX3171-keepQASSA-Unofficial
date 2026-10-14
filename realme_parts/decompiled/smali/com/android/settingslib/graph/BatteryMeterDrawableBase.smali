.class public Lcom/android/settingslib/graph/BatteryMeterDrawableBase;
.super Landroid/graphics/drawable/Drawable;
.source "BatteryMeterDrawableBase.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/android/settingslib/graph/BatteryMeterDrawableBase;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    const/4 p1, 0x0

    int-to-float v0, p1

    .line 2
    invoke-virtual {p0}, Lcom/android/settingslib/graph/BatteryMeterDrawableBase;->getAspectRatio()F

    move-result p0

    mul-float/2addr p0, v0

    float-to-int p0, p0

    sub-int/2addr p1, p0

    .line 3
    div-int/lit8 p1, p1, 0x2

    const/4 p0, 0x0

    mul-float/2addr v0, p0

    .line 4
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    const/4 p0, 0x0

    .line 5
    throw p0
.end method

.method protected getAspectRatio()F
    .locals 0

    const p0, 0x3f147ae1    # 0.58f

    return p0
.end method

.method public getIntrinsicHeight()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 0

    const/4 p0, 0x0

    .line 1
    throw p0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setBounds(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    .line 3
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    const/4 p0, 0x0

    throw p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    throw p0
.end method
