.class Lcom/realmeparts/FPSInfoService$FPSView;
.super Landroid/view/View;
.source "FPSInfoService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/FPSInfoService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FPSView"
.end annotation


# instance fields
.field private final mAscent:F

.field private final mCurFPSHandler:Landroid/os/Handler;

.field private mDataAvail:Z

.field private final mFH:I

.field private final mMaxWidth:I

.field private mNeededHeight:I

.field private mNeededWidth:I

.field private final mOnlinePaint:Landroid/graphics/Paint;

.field final synthetic this$0:Lcom/realmeparts/FPSInfoService;


# direct methods
.method constructor <init>(Lcom/realmeparts/FPSInfoService;Landroid/content/Context;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->this$0:Lcom/realmeparts/FPSInfoService;

    .line 2
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 3
    new-instance p1, Lcom/realmeparts/FPSInfoService$FPSView$1;

    invoke-direct {p1, p0}, Lcom/realmeparts/FPSInfoService$FPSView$1;-><init>(Lcom/realmeparts/FPSInfoService$FPSView;)V

    iput-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mCurFPSHandler:Landroid/os/Handler;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mDataAvail:Z

    .line 4
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x40a00000    # 5.0f

    mul-float v0, p1, p2

    .line 5
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 6
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    const/16 v0, 0x60

    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    const/high16 v0, 0x41400000    # 12.0f

    mul-float/2addr p1, v0

    .line 8
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    const-string v0, "monospace"

    .line 9
    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    .line 10
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    .line 11
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 12
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 13
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 14
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    const/high16 v1, -0x1000000

    invoke-virtual {p1, p2, v0, v0, v1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 16
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->ascent()F

    move-result p1

    iput p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mAscent:F

    .line 17
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->descent()F

    move-result p1

    .line 18
    iget p2, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mAscent:F

    sub-float/2addr p1, p2

    const/high16 p2, 0x3f000000    # 0.5f

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mFH:I

    .line 19
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    const-string p2, "fps: 60.1"

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mMaxWidth:I

    .line 20
    invoke-virtual {p0}, Lcom/realmeparts/FPSInfoService$FPSView;->updateDisplay()V

    return-void
.end method

.method static synthetic access$502(Lcom/realmeparts/FPSInfoService$FPSView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mDataAvail:Z

    return p1
.end method

.method private getFPSInfoString()Ljava/lang/String;
    .locals 1

    const-string v0, "Fps: "

    .line 1
    invoke-static {v0}, Lcom/android/tools/r8/GeneratedOutlineSupport;->outline2(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p0}, Lcom/realmeparts/FPSInfoService;->access$400(Lcom/realmeparts/FPSInfoService;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getHandler()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mCurFPSHandler:Landroid/os/Handler;

    return-object p0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mCurFPSHandler:Landroid/os/Handler;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget-boolean v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mDataAvail:Z

    if-nez v0, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 4
    iget v1, p0, Landroid/view/View;->mPaddingTop:I

    .line 5
    iget v2, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mAscent:F

    float-to-int v2, v2

    sub-int/2addr v1, v2

    .line 6
    invoke-direct {p0}, Lcom/realmeparts/FPSInfoService$FPSView;->getFPSInfoString()Ljava/lang/String;

    move-result-object v2

    .line 7
    iget v3, p0, Landroid/view/View;->mPaddingLeft:I

    sub-int/2addr v0, v3

    iget v3, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mMaxWidth:I

    sub-int/2addr v0, v3

    int-to-float v0, v0

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mOnlinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mNeededWidth:I

    invoke-static {v0, p1}, Landroid/view/View;->resolveSize(II)I

    move-result p1

    iget v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mNeededHeight:I

    .line 2
    invoke-static {v0, p2}, Landroid/view/View;->resolveSize(II)I

    move-result p2

    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method updateDisplay()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mDataAvail:Z

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget v0, p0, Landroid/view/View;->mPaddingLeft:I

    iget v1, p0, Landroid/view/View;->mPaddingRight:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mMaxWidth:I

    add-int/2addr v0, v1

    .line 3
    iget v1, p0, Landroid/view/View;->mPaddingTop:I

    iget v2, p0, Landroid/view/View;->mPaddingBottom:I

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x28

    .line 4
    iget v2, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mNeededWidth:I

    if-ne v0, v2, :cond_2

    iget v2, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mNeededHeight:I

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 5
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_1

    .line 6
    :cond_2
    :goto_0
    iput v0, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mNeededWidth:I

    .line 7
    iput v1, p0, Lcom/realmeparts/FPSInfoService$FPSView;->mNeededHeight:I

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :goto_1
    return-void
.end method
