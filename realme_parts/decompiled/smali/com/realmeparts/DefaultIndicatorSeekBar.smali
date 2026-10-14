.class public Lcom/realmeparts/DefaultIndicatorSeekBar;
.super Landroid/widget/SeekBar;
.source "DefaultIndicatorSeekBar.java"


# instance fields
.field private mDefaultProgress:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 2
    iput p1, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 4
    iput p1, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 6
    iput p1, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, -0x1

    .line 8
    iput p1, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    return-void
.end method


# virtual methods
.method public getDefaultProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    return p0
.end method

.method public setDefaultProgress(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    if-eq v0, p1, :cond_0

    .line 2
    iput p1, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;->mDefaultProgress:I

    .line 3
    invoke-virtual {p0}, Landroid/widget/SeekBar;->invalidate()V

    :cond_0
    return-void
.end method
