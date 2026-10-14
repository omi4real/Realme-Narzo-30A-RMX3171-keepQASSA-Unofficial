.class public Landroidx/appcompat/widget/LinearLayoutCompat;
.super Landroid/view/ViewGroup;
.source "LinearLayoutCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    }
.end annotation


# instance fields
.field private mBaselineAligned:Z

.field private mBaselineAlignedChildIndex:I

.field private mBaselineChildTop:I

.field private mDivider:Landroid/graphics/drawable/Drawable;

.field private mDividerHeight:I

.field private mDividerPadding:I

.field private mDividerWidth:I

.field private mGravity:I

.field private mMaxAscent:[I

.field private mMaxDescent:[I

.field private mOrientation:I

.field private mShowDividers:I

.field private mTotalLength:I

.field private mUseLargestChild:Z

.field private mWeightSum:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11

    .line 3
    sget-object v2, Landroidx/appcompat/R$styleable;->LinearLayoutCompat:[I

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v7, 0x1

    .line 4
    iput-boolean v7, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    const/4 v8, -0x1

    .line 5
    iput v8, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    const/4 v9, 0x0

    .line 6
    iput v9, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineChildTop:I

    const v0, 0x800033

    .line 7
    iput v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    .line 8
    invoke-static {p1, p2, v2, p3, v9}, Landroidx/appcompat/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/TintTypedArray;

    move-result-object v10

    .line 9
    invoke-virtual {v10}, Landroidx/appcompat/widget/TintTypedArray;->getWrappedTypeArray()Landroid/content/res/TypedArray;

    move-result-object v4

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v5, p3

    .line 10
    invoke-static/range {v0 .. v6}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 11
    invoke-virtual {v10, v7, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p1

    if-ltz p1, :cond_0

    .line 12
    iget p2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    if-eq p2, p1, :cond_0

    .line 13
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 15
    :cond_0
    invoke-virtual {v10, v9, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p1

    if-ltz p1, :cond_3

    .line 16
    iget p2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    if-eq p2, p1, :cond_3

    const p2, 0x800007

    and-int/2addr p2, p1

    if-nez p2, :cond_1

    const p2, 0x800003

    or-int/2addr p1, p2

    :cond_1
    and-int/lit8 p2, p1, 0x70

    if-nez p2, :cond_2

    or-int/lit8 p1, p1, 0x30

    .line 17
    :cond_2
    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_3
    const/4 p1, 0x2

    .line 19
    invoke-virtual {v10, p1, v7}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result p1

    if-nez p1, :cond_4

    .line 20
    iput-boolean p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    :cond_4
    const/4 p1, 0x4

    const/high16 p2, -0x40800000    # -1.0f

    .line 21
    invoke-virtual {v10, p1, p2}, Landroidx/appcompat/widget/TintTypedArray;->getFloat(IF)F

    move-result p1

    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    const/4 p1, 0x3

    .line 22
    invoke-virtual {v10, p1, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p1

    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    const/4 p1, 0x7

    .line 23
    invoke-virtual {v10, p1, v9}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    const/4 p1, 0x5

    .line 24
    invoke-virtual {v10, p1}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 25
    iget-object p2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    if-ne p1, p2, :cond_5

    goto :goto_2

    .line 26
    :cond_5
    iput-object p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_6

    .line 27
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    iput p2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    .line 28
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    iput p2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    goto :goto_0

    .line 29
    :cond_6
    iput v9, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    .line 30
    iput v9, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    :goto_0
    if-nez p1, :cond_7

    goto :goto_1

    :cond_7
    move v7, v9

    .line 31
    :goto_1
    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :goto_2
    const/16 p1, 0x8

    .line 33
    invoke-virtual {v10, p1, v9}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result p1

    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    const/4 p1, 0x6

    .line 34
    invoke-virtual {v10, p1, v9}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    .line 35
    invoke-virtual {v10}, Landroidx/appcompat/widget/TintTypedArray;->recycle()V

    return-void
.end method

.method private forceUniformHeight(II)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 2
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 3
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v4, 0x8

    if-eq v2, v4, :cond_0

    .line 4
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 5
    iget v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    .line 6
    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 7
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    iput v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move v4, p2

    move v6, v0

    .line 8
    invoke-virtual/range {v2 .. v7}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 9
    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private forceUniformWidth(II)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 2
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 3
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v4, 0x8

    if-eq v2, v4, :cond_0

    .line 4
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 5
    iget v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    .line 6
    iget v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 7
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    iput v2, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move v4, v0

    move v6, p2

    .line 8
    invoke-virtual/range {v2 .. v7}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 9
    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    return p0
.end method

.method drawHorizontalDivider(Landroid/graphics/Canvas;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    add-int/2addr v1, v2

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    sub-int/2addr v2, v3

    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v3, p2

    .line 3
    invoke-virtual {v0, v1, p2, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method drawVerticalDivider(Landroid/graphics/Canvas;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    add-int/2addr v1, v2

    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v2, p2

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerPadding:I

    sub-int/2addr v3, v4

    .line 3
    invoke-virtual {v0, p2, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 4
    iget-object p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->generateDefaultLayoutParams()Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method protected generateDefaultLayoutParams()Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .locals 2

    .line 2
    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v0, -0x2

    if-nez p0, :cond_0

    .line 3
    new-instance p0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    invoke-direct {p0, v0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(II)V

    return-object p0

    :cond_0
    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    .line 4
    new-instance p0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p0, v1, v0}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(II)V

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .locals 1

    .line 3
    new-instance v0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;
    .locals 0

    .line 4
    new-instance p0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    invoke-direct {p0, p1}, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getBaseline()I
    .locals 5

    .line 1
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    if-gez v0, :cond_0

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->getBaseline()I

    move-result p0

    return p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    if-le v0, v1, :cond_6

    .line 4
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 6
    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    if-nez p0, :cond_1

    return v2

    .line 7
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "mBaselineAlignedChildIndex of LinearLayout points to a View that doesn\'t know how to get its baseline."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 8
    :cond_2
    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineChildTop:I

    .line 9
    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_5

    .line 10
    iget v3, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v3, v3, 0x70

    const/16 v4, 0x30

    if-eq v3, v4, :cond_5

    const/16 v4, 0x10

    if-eq v3, v4, :cond_4

    const/16 v4, 0x50

    if-eq v3, v4, :cond_3

    goto :goto_0

    .line 11
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBottom()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v2, p0

    goto :goto_0

    .line 12
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBottom()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v3, p0

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    .line 13
    :cond_5
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 14
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, p0

    add-int/2addr v2, v1

    return v2

    .line 15
    :cond_6
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method getChildrenSkipCount()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getDividerDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public getDividerWidth()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    return p0
.end method

.method public getGravity()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    return p0
.end method

.method getLocationOffset()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method getNextLocationOffset()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method protected hasDividerBeforeChildAt(I)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 1
    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    and-int/2addr p0, v1

    if-eqz p0, :cond_0

    move v0, v1

    :cond_0
    return v0

    .line 2
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ne p1, v2, :cond_3

    .line 3
    iget p0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_2

    move v0, v1

    :cond_2
    return v0

    .line 4
    :cond_3
    iget v2, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mShowDividers:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_5

    sub-int/2addr p1, v1

    :goto_0
    if-ltz p1, :cond_5

    .line 5
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_4

    move v0, v1

    goto :goto_1

    :cond_4
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_5
    :goto_1
    return v0
.end method

.method measureChildBeforeLayout(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    return-void
.end method

.method measureNullChild()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDivider:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget v0, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_4

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 5
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eq v4, v1, :cond_1

    .line 6
    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 7
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 8
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iget v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v3, v4

    iget v4, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    sub-int/2addr v3, v4

    .line 9
    invoke-virtual {p0, p1, v3}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 10
    :cond_2
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v1

    if-eqz v1, :cond_b

    add-int/lit8 v0, v0, -0x1

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_3

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    sub-int/2addr v0, v1

    goto :goto_1

    .line 13
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    .line 15
    :goto_1
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    goto/16 :goto_6

    .line 16
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 17
    invoke-static {p0}, Landroidx/appcompat/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v3

    :goto_2
    if-ge v2, v0, :cond_7

    .line 18
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 19
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v1, :cond_6

    .line 20
    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 21
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    if-eqz v3, :cond_5

    .line 22
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    iget v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v4, v5

    goto :goto_3

    .line 23
    :cond_5
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    iget v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v4, v5

    iget v5, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    sub-int/2addr v4, v5

    .line 24
    :goto_3
    invoke-virtual {p0, p1, v4}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 25
    :cond_7
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v1

    if-eqz v1, :cond_b

    add-int/lit8 v0, v0, -0x1

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_9

    if-eqz v3, :cond_8

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    goto :goto_5

    .line 28
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    goto :goto_4

    .line 29
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    if-eqz v3, :cond_a

    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    :goto_4
    sub-int/2addr v0, v1

    goto :goto_5

    .line 31
    :cond_a
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v0, v1

    .line 32
    :goto_5
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    :cond_b
    :goto_6
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    const-string p0, "androidx.appcompat.widget.LinearLayoutCompat"

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    const-string p0, "androidx.appcompat.widget.LinearLayoutCompat"

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 23

    move-object/from16 v0, p0

    .line 1
    iget v1, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/16 v2, 0x50

    const/16 v3, 0x10

    const/16 v4, 0x8

    const/4 v6, 0x5

    const v7, 0x800007

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-ne v1, v9, :cond_8

    .line 2
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    sub-int v10, p4, p2

    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v11

    sub-int v11, v10, v11

    sub-int/2addr v10, v1

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v12

    sub-int/2addr v10, v12

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v12

    .line 6
    iget v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/lit8 v14, v13, 0x70

    and-int/2addr v7, v13

    if-eq v14, v3, :cond_1

    if-eq v14, v2, :cond_0

    .line 7
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    add-int v2, v2, p5

    sub-int v2, v2, p3

    iget v3, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v2, v3

    goto :goto_0

    .line 9
    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    sub-int v3, p5, p3

    iget v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v3, v13

    div-int/2addr v3, v8

    add-int/2addr v2, v3

    :goto_0
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v12, :cond_16

    .line 10
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_2

    .line 11
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild()I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_4

    .line 12
    :cond_2
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-eq v13, v4, :cond_7

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    .line 14
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    .line 15
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 16
    iget v4, v15, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    if-gez v4, :cond_3

    move v4, v7

    .line 17
    :cond_3
    invoke-static/range {p0 .. p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v8

    .line 18
    invoke-static {v4, v8}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v4

    and-int/lit8 v4, v4, 0x7

    if-eq v4, v9, :cond_5

    if-eq v4, v6, :cond_4

    .line 19
    iget v4, v15, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v4, v1

    goto :goto_3

    :cond_4
    sub-int v4, v11, v13

    .line 20
    iget v8, v15, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto :goto_2

    :cond_5
    sub-int v4, v10, v13

    const/4 v8, 0x2

    .line 21
    div-int/2addr v4, v8

    add-int/2addr v4, v1

    iget v8, v15, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v4, v8

    iget v8, v15, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :goto_2
    sub-int/2addr v4, v8

    .line 22
    :goto_3
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 23
    iget v8, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v2, v8

    .line 24
    :cond_6
    iget v8, v15, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v8

    .line 25
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getLocationOffset()I

    move-result v8

    add-int/2addr v8, v2

    add-int/2addr v13, v4

    add-int v6, v14, v8

    .line 26
    invoke-virtual {v3, v4, v8, v13, v6}, Landroid/view/View;->layout(IIII)V

    .line 27
    iget v3, v15, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v14, v3

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v3

    add-int/2addr v14, v3

    add-int/2addr v14, v2

    .line 28
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v2

    add-int/2addr v5, v2

    move v2, v14

    :cond_7
    :goto_4
    add-int/2addr v5, v9

    const/16 v4, 0x8

    const/4 v6, 0x5

    const/4 v8, 0x2

    goto :goto_1

    .line 29
    :cond_8
    invoke-static/range {p0 .. p0}, Landroidx/appcompat/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v1

    .line 30
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    sub-int v6, p5, p3

    .line 31
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v8

    sub-int v8, v6, v8

    sub-int/2addr v6, v4

    .line 32
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v6, v10

    .line 33
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v10

    .line 34
    iget v11, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    and-int/2addr v7, v11

    and-int/lit8 v11, v11, 0x70

    .line 35
    iget-boolean v12, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    .line 36
    iget-object v13, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    .line 37
    iget-object v14, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    .line 38
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v15

    .line 39
    invoke-static {v7, v15}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v7

    if-eq v7, v9, :cond_a

    const/4 v15, 0x5

    if-eq v7, v15, :cond_9

    .line 40
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v7

    goto :goto_5

    .line 41
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v7

    add-int v7, v7, p4

    sub-int v7, v7, p2

    iget v15, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v7, v15

    goto :goto_5

    .line 42
    :cond_a
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v7

    sub-int v15, p4, p2

    iget v5, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v15, v5

    const/4 v5, 0x2

    div-int/2addr v15, v5

    add-int/2addr v7, v15

    :goto_5
    if-eqz v1, :cond_b

    add-int/lit8 v1, v10, -0x1

    move/from16 v16, v1

    const/4 v1, 0x0

    const/4 v15, -0x1

    goto :goto_6

    :cond_b
    move v15, v9

    const/4 v1, 0x0

    const/16 v16, 0x0

    :goto_6
    if-ge v1, v10, :cond_16

    mul-int v17, v15, v1

    add-int v9, v17, v16

    .line 43
    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_d

    .line 44
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild()I

    move-result v2

    add-int/2addr v7, v2

    :cond_c
    move/from16 p3, v10

    move/from16 p5, v11

    move/from16 v20, v12

    :goto_7
    const/4 v2, 0x1

    goto/16 :goto_a

    .line 45
    :cond_d
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v5, 0x8

    if-eq v3, v5, :cond_c

    .line 46
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 47
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v19

    .line 48
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    move-object/from16 v5, v20

    check-cast v5, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    if-eqz v12, :cond_e

    move/from16 p3, v10

    .line 49
    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    move/from16 p5, v11

    const/4 v11, -0x1

    if-eq v10, v11, :cond_f

    .line 50
    invoke-virtual {v2}, Landroid/view/View;->getBaseline()I

    move-result v11

    goto :goto_8

    :cond_e
    move/from16 p3, v10

    move/from16 p5, v11

    :cond_f
    const/4 v11, -0x1

    .line 51
    :goto_8
    iget v10, v5, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    if-gez v10, :cond_10

    move/from16 v10, p5

    :cond_10
    and-int/lit8 v10, v10, 0x70

    move/from16 v20, v12

    const/16 v12, 0x10

    if-eq v10, v12, :cond_13

    const/16 v12, 0x30

    if-eq v10, v12, :cond_12

    const/16 v12, 0x50

    if-eq v10, v12, :cond_11

    move v10, v4

    const/4 v12, -0x1

    goto :goto_9

    :cond_11
    sub-int v10, v8, v19

    .line 52
    iget v12, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v10, v12

    const/4 v12, -0x1

    if-eq v11, v12, :cond_14

    .line 53
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v21

    sub-int v21, v21, v11

    const/4 v11, 0x2

    .line 54
    aget v22, v14, v11

    sub-int v22, v22, v21

    sub-int v10, v10, v22

    goto :goto_9

    :cond_12
    const/4 v12, -0x1

    .line 55
    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v10, v4

    if-eq v11, v12, :cond_14

    const/16 v18, 0x1

    .line 56
    aget v21, v13, v18

    sub-int v21, v21, v11

    add-int v10, v21, v10

    goto :goto_9

    :cond_13
    const/4 v12, -0x1

    sub-int v10, v6, v19

    const/4 v11, 0x2

    .line 57
    div-int/2addr v10, v11

    add-int/2addr v10, v4

    iget v11, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v10, v11

    iget v11, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v10, v11

    .line 58
    :cond_14
    :goto_9
    invoke-virtual {v0, v9}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 59
    iget v9, v0, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v7, v9

    .line 60
    :cond_15
    iget v9, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v7, v9

    .line 61
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getLocationOffset()I

    move-result v9

    add-int/2addr v9, v7

    add-int v11, v3, v9

    add-int v12, v19, v10

    .line 62
    invoke-virtual {v2, v9, v10, v11, v12}, Landroid/view/View;->layout(IIII)V

    .line 63
    iget v2, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v3, v2

    .line 64
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v2

    add-int/2addr v3, v2

    add-int/2addr v7, v3

    .line 65
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v2

    add-int/2addr v1, v2

    goto/16 :goto_7

    :goto_a
    add-int/2addr v1, v2

    move/from16 v10, p3

    move/from16 v11, p5

    move v9, v2

    move/from16 v12, v20

    const/16 v2, 0x50

    const/16 v3, 0x10

    goto/16 :goto_6

    :cond_16
    return-void
.end method

.method protected onMeasure(II)V
    .locals 39

    move-object/from16 v6, p0

    move/from16 v7, p1

    move/from16 v8, p2

    .line 1
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mOrientation:I

    const/4 v10, -0x2

    const/16 v12, 0x8

    const/4 v13, 0x0

    const/4 v15, 0x1

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v4, 0x0

    if-ne v0, v15, :cond_2a

    .line 2
    iput v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    .line 4
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 5
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 6
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAlignedChildIndex:I

    .line 7
    iget-boolean v9, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    move v14, v4

    move/from16 v19, v14

    move/from16 v20, v19

    move/from16 v21, v20

    move/from16 v23, v21

    move/from16 v24, v23

    move/from16 v25, v24

    move/from16 v22, v13

    move/from16 v18, v15

    move/from16 v15, v25

    :goto_0
    if-ge v15, v3, :cond_10

    .line 8
    invoke-virtual {v6, v15}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v26

    if-nez v26, :cond_0

    .line 9
    iget v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild()I

    move-result v26

    add-int v4, v4, v26

    iput v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-ne v4, v12, :cond_1

    .line 11
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v4

    add-int/2addr v15, v4

    :goto_1
    move v10, v0

    move/from16 v29, v1

    move v0, v2

    move/from16 v31, v3

    move/from16 v3, v20

    :goto_2
    const/4 v1, 0x1

    goto/16 :goto_c

    .line 12
    :cond_1
    invoke-virtual {v6, v15}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 13
    iget v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v12, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v4, v12

    iput v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 14
    :cond_2
    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 15
    iget v4, v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    add-float v22, v22, v4

    if-ne v1, v5, :cond_3

    .line 16
    iget v5, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-nez v5, :cond_3

    cmpl-float v4, v4, v13

    if-lez v4, :cond_3

    .line 17
    iget v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 18
    iget v5, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v5, v4

    iget v11, v12, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v11

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v10, v0

    move/from16 v29, v1

    move/from16 v30, v2

    move/from16 v31, v3

    const/16 v23, 0x1

    goto :goto_5

    .line 19
    :cond_3
    iget v4, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-nez v4, :cond_4

    iget v4, v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v4, v4, v13

    if-lez v4, :cond_4

    .line 20
    iput v10, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v11, 0x0

    goto :goto_3

    :cond_4
    const/high16 v11, -0x80000000

    :goto_3
    const/4 v4, 0x0

    cmpl-float v5, v22, v13

    if-nez v5, :cond_5

    .line 21
    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v10, v0

    goto :goto_4

    :cond_5
    move v10, v0

    const/4 v5, 0x0

    :goto_4
    move-object/from16 v0, p0

    move/from16 v29, v1

    move-object/from16 v1, v26

    move/from16 v30, v2

    move/from16 v2, p1

    move/from16 v31, v3

    move v3, v4

    move/from16 v4, p2

    .line 22
    invoke-virtual/range {v0 .. v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildBeforeLayout(Landroid/view/View;IIII)V

    const/high16 v0, -0x80000000

    if-eq v11, v0, :cond_6

    .line 23
    iput v11, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 24
    :cond_6
    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 25
    iget v1, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    add-int v2, v1, v0

    .line 26
    iget v3, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    iget v3, v12, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v2, v3

    .line 27
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v3

    add-int/2addr v2, v3

    .line 28
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    if-eqz v9, :cond_7

    .line 29
    invoke-static {v0, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    :cond_7
    :goto_5
    if-ltz v10, :cond_8

    add-int/lit8 v0, v15, 0x1

    if-ne v10, v0, :cond_8

    .line 30
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iput v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineChildTop:I

    :cond_8
    if-ge v15, v10, :cond_a

    .line 31
    iget v0, v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    cmpl-float v0, v0, v13

    if-gtz v0, :cond_9

    goto :goto_6

    .line 32
    :cond_9
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won\'t work.  Either remove the weight, or don\'t set mBaselineAlignedChildIndex."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    :goto_6
    move/from16 v0, v30

    const/high16 v11, 0x40000000    # 2.0f

    if-eq v0, v11, :cond_b

    .line 33
    iget v1, v12, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_b

    const/4 v4, 0x1

    const/16 v24, 0x1

    goto :goto_7

    :cond_b
    const/4 v4, 0x0

    .line 34
    :goto_7
    iget v1, v12, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v2, v12, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v2

    .line 35
    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v2, v1

    move/from16 v3, v20

    .line 36
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 37
    invoke-virtual/range {v26 .. v26}, Landroid/view/View;->getMeasuredState()I

    move-result v5

    move/from16 v11, v25

    .line 38
    invoke-static {v11, v5}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v5

    if-eqz v18, :cond_c

    .line 39
    iget v11, v12, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v13, -0x1

    if-ne v11, v13, :cond_c

    const/4 v11, 0x1

    goto :goto_8

    :cond_c
    const/4 v11, 0x0

    .line 40
    :goto_8
    iget v12, v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/4 v13, 0x0

    cmpl-float v12, v12, v13

    if-lez v12, :cond_e

    if-eqz v4, :cond_d

    goto :goto_9

    :cond_d
    move v1, v2

    :goto_9
    move/from16 v12, v19

    .line 41
    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    move-result v19

    goto :goto_b

    :cond_e
    move/from16 v12, v19

    if-eqz v4, :cond_f

    goto :goto_a

    :cond_f
    move v1, v2

    :goto_a
    move/from16 v4, v21

    .line 42
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v21

    move/from16 v19, v12

    .line 43
    :goto_b
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v1

    add-int/2addr v15, v1

    move/from16 v25, v5

    move/from16 v18, v11

    goto/16 :goto_2

    :goto_c
    add-int/2addr v15, v1

    move v2, v0

    move/from16 v20, v3

    move v0, v10

    move/from16 v1, v29

    move/from16 v3, v31

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v10, -0x2

    const/16 v12, 0x8

    const/4 v13, 0x0

    goto/16 :goto_0

    :cond_10
    move/from16 v29, v1

    move v0, v2

    move/from16 v31, v3

    move/from16 v12, v19

    move/from16 v3, v20

    move/from16 v4, v21

    move/from16 v11, v25

    .line 44
    iget v1, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    if-lez v1, :cond_11

    move/from16 v1, v31

    invoke-virtual {v6, v1}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 45
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerHeight:I

    add-int/2addr v2, v5

    iput v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_d

    :cond_11
    move/from16 v1, v31

    :cond_12
    :goto_d
    if-eqz v9, :cond_17

    move/from16 v2, v29

    const/high16 v5, -0x80000000

    if-eq v2, v5, :cond_14

    if-nez v2, :cond_13

    goto :goto_e

    :cond_13
    move/from16 v19, v3

    goto :goto_12

    :cond_14
    :goto_e
    const/4 v10, 0x0

    .line 46
    iput v10, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v5, v10

    :goto_f
    if-ge v5, v1, :cond_13

    .line 47
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    if-nez v13, :cond_15

    .line 48
    iget v13, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild()I

    move-result v15

    add-int/2addr v13, v15

    iput v13, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_10

    .line 49
    :cond_15
    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    move-result v15

    const/16 v10, 0x8

    if-ne v15, v10, :cond_16

    .line 50
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v10

    add-int/2addr v5, v10

    :goto_10
    move/from16 v19, v3

    goto :goto_11

    .line 51
    :cond_16
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 52
    iget v13, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    add-int v15, v13, v14

    move/from16 v19, v3

    .line 53
    iget v3, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v15, v3

    iget v3, v10, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v15, v3

    .line 54
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v3

    add-int/2addr v15, v3

    .line 55
    invoke-static {v13, v15}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    :goto_11
    const/4 v3, 0x1

    add-int/2addr v5, v3

    move/from16 v3, v19

    const/4 v10, 0x0

    goto :goto_f

    :cond_17
    move/from16 v19, v3

    move/from16 v2, v29

    .line 56
    :goto_12
    iget v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v10

    add-int/2addr v10, v5

    add-int/2addr v10, v3

    iput v10, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 57
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v3

    invoke-static {v10, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v5, 0x0

    .line 58
    invoke-static {v3, v8, v5}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v3

    const v5, 0xffffff

    and-int/2addr v5, v3

    .line 59
    iget v10, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v5, v10

    if-nez v23, :cond_1c

    if-eqz v5, :cond_18

    const/4 v10, 0x0

    cmpl-float v13, v22, v10

    if-lez v13, :cond_18

    goto :goto_15

    .line 60
    :cond_18
    invoke-static {v4, v12}, Ljava/lang/Math;->max(II)I

    move-result v4

    if-eqz v9, :cond_1b

    const/high16 v5, 0x40000000    # 2.0f

    if-eq v2, v5, :cond_1b

    const/4 v2, 0x0

    :goto_13
    if-ge v2, v1, :cond_1b

    .line 61
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1a

    .line 62
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_19

    goto :goto_14

    .line 63
    :cond_19
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 64
    iget v9, v9, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-lez v9, :cond_1a

    .line 65
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    const/high16 v10, 0x40000000    # 2.0f

    invoke-static {v9, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 66
    invoke-static {v14, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    .line 67
    invoke-virtual {v5, v9, v12}, Landroid/view/View;->measure(II)V

    :cond_1a
    :goto_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_1b
    move/from16 v20, v19

    goto/16 :goto_1e

    .line 68
    :cond_1c
    :goto_15
    iget v9, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    const/4 v10, 0x0

    cmpl-float v12, v9, v10

    if-lez v12, :cond_1d

    move/from16 v22, v9

    :cond_1d
    const/4 v9, 0x0

    .line 69
    iput v9, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v10, v4

    move/from16 v9, v19

    const/4 v4, 0x0

    :goto_16
    if-ge v4, v1, :cond_28

    .line 70
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 71
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    const/16 v14, 0x8

    if-ne v13, v14, :cond_1e

    move/from16 v29, v2

    goto/16 :goto_1d

    .line 72
    :cond_1e
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 73
    iget v14, v13, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/4 v15, 0x0

    cmpl-float v16, v14, v15

    if-lez v16, :cond_23

    int-to-float v15, v5

    mul-float/2addr v15, v14

    div-float v15, v15, v22

    float-to-int v15, v15

    sub-float v22, v22, v14

    sub-int/2addr v5, v15

    .line 74
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v14

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v16

    add-int v16, v16, v14

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int v16, v16, v14

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int v14, v16, v14

    move/from16 v16, v5

    iget v5, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 75
    invoke-static {v7, v14, v5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v5

    .line 76
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-nez v14, :cond_21

    const/high16 v14, 0x40000000    # 2.0f

    if-eq v2, v14, :cond_1f

    goto :goto_18

    :cond_1f
    if-lez v15, :cond_20

    goto :goto_17

    :cond_20
    const/4 v15, 0x0

    .line 77
    :goto_17
    invoke-static {v15, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    .line 78
    invoke-virtual {v12, v5, v15}, Landroid/view/View;->measure(II)V

    goto :goto_19

    :cond_21
    const/high16 v14, 0x40000000    # 2.0f

    .line 79
    :goto_18
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v19

    add-int v15, v19, v15

    if-gez v15, :cond_22

    const/4 v15, 0x0

    .line 80
    :cond_22
    invoke-static {v15, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    .line 81
    invoke-virtual {v12, v5, v15}, Landroid/view/View;->measure(II)V

    .line 82
    :goto_19
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredState()I

    move-result v5

    and-int/lit16 v5, v5, -0x100

    .line 83
    invoke-static {v11, v5}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v11

    move/from16 v5, v16

    .line 84
    :cond_23
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v15, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v14, v15

    .line 85
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v15, v14

    .line 86
    invoke-static {v9, v15}, Ljava/lang/Math;->max(II)I

    move-result v9

    move/from16 v29, v2

    const/high16 v2, 0x40000000    # 2.0f

    if-eq v0, v2, :cond_24

    .line 87
    iget v2, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    move/from16 v16, v5

    const/4 v5, -0x1

    if-ne v2, v5, :cond_25

    const/4 v2, 0x1

    goto :goto_1a

    :cond_24
    move/from16 v16, v5

    const/4 v5, -0x1

    :cond_25
    const/4 v2, 0x0

    :goto_1a
    if-eqz v2, :cond_26

    goto :goto_1b

    :cond_26
    move v14, v15

    .line 88
    :goto_1b
    invoke-static {v10, v14}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-eqz v18, :cond_27

    .line 89
    iget v10, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-ne v10, v5, :cond_27

    const/4 v5, 0x1

    goto :goto_1c

    :cond_27
    const/4 v5, 0x0

    .line 90
    :goto_1c
    iget v10, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 91
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    add-int/2addr v12, v10

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v12, v14

    iget v13, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v12, v13

    .line 92
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v13

    add-int/2addr v12, v13

    .line 93
    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v10

    iput v10, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v10, v2

    move/from16 v18, v5

    move/from16 v5, v16

    :goto_1d
    add-int/lit8 v4, v4, 0x1

    move/from16 v2, v29

    goto/16 :goto_16

    .line 94
    :cond_28
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v5

    add-int/2addr v5, v4

    add-int/2addr v5, v2

    iput v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v20, v9

    move v4, v10

    :goto_1e
    if-nez v18, :cond_29

    const/high16 v2, 0x40000000    # 2.0f

    if-eq v0, v2, :cond_29

    goto :goto_1f

    :cond_29
    move/from16 v4, v20

    .line 95
    :goto_1f
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v2

    add-int/2addr v2, v0

    add-int/2addr v2, v4

    .line 96
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 97
    invoke-static {v0, v7, v11}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v0

    invoke-virtual {v6, v0, v3}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    if-eqz v24, :cond_62

    .line 98
    invoke-direct {v6, v1, v8}, Landroidx/appcompat/widget/LinearLayoutCompat;->forceUniformWidth(II)V

    goto/16 :goto_45

    :cond_2a
    move v0, v4

    .line 99
    iput v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 100
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v9

    .line 101
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    .line 102
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v11

    .line 103
    iget-object v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    const/4 v12, 0x4

    if-eqz v0, :cond_2b

    iget-object v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    if-nez v0, :cond_2c

    :cond_2b
    new-array v0, v12, [I

    .line 104
    iput-object v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    new-array v0, v12, [I

    .line 105
    iput-object v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    .line 106
    :cond_2c
    iget-object v13, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxAscent:[I

    .line 107
    iget-object v14, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mMaxDescent:[I

    const/4 v15, 0x3

    const/4 v0, -0x1

    .line 108
    aput v0, v13, v15

    const/16 v18, 0x2

    aput v0, v13, v18

    const/4 v1, 0x1

    aput v0, v13, v1

    const/4 v2, 0x0

    aput v0, v13, v2

    .line 109
    aput v0, v14, v15

    aput v0, v14, v18

    aput v0, v14, v1

    aput v0, v14, v2

    .line 110
    iget-boolean v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    .line 111
    iget-boolean v4, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mUseLargestChild:Z

    const/high16 v0, 0x40000000    # 2.0f

    if-ne v10, v0, :cond_2d

    const/16 v19, 0x1

    goto :goto_20

    :cond_2d
    const/16 v19, 0x0

    :goto_20
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x1

    :goto_21
    if-ge v3, v9, :cond_41

    .line 112
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-nez v8, :cond_2e

    .line 113
    iget v8, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild()I

    move-result v27

    add-int v8, v8, v27

    iput v8, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v28, v4

    move/from16 v29, v5

    :goto_22
    const/4 v4, 0x1

    goto/16 :goto_2f

    :cond_2e
    move/from16 v27, v0

    .line 114
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v0

    move/from16 v28, v1

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2f

    .line 115
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v0

    add-int/2addr v3, v0

    move/from16 v29, v5

    move/from16 v0, v27

    move/from16 v1, v28

    move/from16 v28, v4

    goto :goto_22

    .line 116
    :cond_2f
    invoke-virtual {v6, v3}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 117
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v1, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v0, v1

    iput v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 118
    :cond_30
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 119
    iget v0, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    add-float v25, v25, v0

    move/from16 v29, v2

    const/high16 v2, 0x40000000    # 2.0f

    if-ne v10, v2, :cond_33

    .line 120
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-nez v2, :cond_33

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_33

    if-eqz v19, :cond_31

    .line 121
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move/from16 v30, v3

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v2, v3

    add-int/2addr v2, v0

    iput v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_23

    :cond_31
    move/from16 v30, v3

    .line 122
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 123
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v2, v0

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    :goto_23
    if-eqz v5, :cond_32

    const/4 v0, 0x0

    .line 124
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 125
    invoke-virtual {v8, v2, v2}, Landroid/view/View;->measure(II)V

    move/from16 v36, v27

    move/from16 v33, v28

    move/from16 v35, v29

    move/from16 v27, v30

    move/from16 v28, v4

    move/from16 v29, v5

    goto/16 :goto_28

    :cond_32
    move/from16 v36, v27

    move/from16 v33, v28

    move/from16 v35, v29

    move/from16 v27, v30

    const/high16 v0, 0x40000000    # 2.0f

    const/16 v21, 0x1

    move/from16 v28, v4

    move/from16 v29, v5

    goto/16 :goto_29

    :cond_33
    move/from16 v30, v3

    .line 126
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-nez v0, :cond_34

    iget v0, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_35

    const/4 v0, -0x2

    .line 127
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v3, 0x0

    goto :goto_24

    :cond_34
    const/4 v2, 0x0

    :cond_35
    const/high16 v3, -0x80000000

    :goto_24
    cmpl-float v0, v25, v2

    if-nez v0, :cond_36

    .line 128
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move/from16 v31, v0

    goto :goto_25

    :cond_36
    const/16 v31, 0x0

    :goto_25
    const/16 v32, 0x0

    move/from16 v2, v27

    move-object/from16 v0, p0

    move-object/from16 v34, v1

    move/from16 v33, v28

    move-object v1, v8

    move/from16 v36, v2

    move/from16 v35, v29

    move/from16 v2, p1

    move/from16 v37, v3

    move/from16 v27, v30

    move/from16 v3, v31

    move/from16 v28, v4

    move/from16 v4, p2

    move/from16 v29, v5

    move/from16 v5, v32

    .line 129
    invoke-virtual/range {v0 .. v5}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureChildBeforeLayout(Landroid/view/View;IIII)V

    move/from16 v0, v37

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_37

    move-object/from16 v1, v34

    .line 130
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    goto :goto_26

    :cond_37
    move-object/from16 v1, v34

    .line 131
    :goto_26
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    if-eqz v19, :cond_38

    .line 132
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v0

    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v3, v4

    .line 133
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v3, v2

    iput v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_27

    .line 134
    :cond_38
    iget v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    add-int v3, v2, v0

    .line 135
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v3, v4

    .line 136
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v4

    add-int/2addr v3, v4

    .line 137
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    :goto_27
    if-eqz v28, :cond_39

    .line 138
    invoke-static {v0, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    :cond_39
    :goto_28
    const/high16 v0, 0x40000000    # 2.0f

    :goto_29
    if-eq v11, v0, :cond_3a

    .line 139
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_3a

    const/4 v4, 0x1

    const/16 v23, 0x1

    goto :goto_2a

    :cond_3a
    const/4 v4, 0x0

    .line 140
    :goto_2a
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v0, v2

    .line 141
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v2, v0

    .line 142
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredState()I

    move-result v3

    invoke-static {v15, v3}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v3

    if-eqz v29, :cond_3c

    .line 143
    invoke-virtual {v8}, Landroid/view/View;->getBaseline()I

    move-result v5

    const/4 v8, -0x1

    if-eq v5, v8, :cond_3c

    .line 144
    iget v8, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    if-gez v8, :cond_3b

    iget v8, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    :cond_3b
    and-int/lit8 v8, v8, 0x70

    const/4 v15, 0x4

    shr-int/2addr v8, v15

    const/4 v15, -0x2

    and-int/2addr v8, v15

    const/4 v15, 0x1

    shr-int/2addr v8, v15

    .line 145
    aget v15, v13, v8

    invoke-static {v15, v5}, Ljava/lang/Math;->max(II)I

    move-result v15

    aput v15, v13, v8

    .line 146
    aget v15, v14, v8

    sub-int v5, v2, v5

    invoke-static {v15, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    aput v5, v14, v8

    :cond_3c
    move/from16 v5, v35

    .line 147
    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-eqz v26, :cond_3d

    .line 148
    iget v8, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v15, -0x1

    if-ne v8, v15, :cond_3d

    const/4 v8, 0x1

    goto :goto_2b

    :cond_3d
    const/4 v8, 0x0

    .line 149
    :goto_2b
    iget v1, v1, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/4 v15, 0x0

    cmpl-float v1, v1, v15

    if-lez v1, :cond_3f

    if-eqz v4, :cond_3e

    goto :goto_2c

    :cond_3e
    move v0, v2

    :goto_2c
    move/from16 v1, v36

    .line 150
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    move/from16 v1, v33

    goto :goto_2e

    :cond_3f
    move/from16 v1, v36

    if-eqz v4, :cond_40

    goto :goto_2d

    :cond_40
    move v0, v2

    :goto_2d
    move/from16 v2, v33

    .line 151
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    move/from16 v38, v1

    move v1, v0

    move/from16 v0, v38

    .line 152
    :goto_2e
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v2

    add-int v2, v27, v2

    move v15, v3

    move/from16 v26, v8

    const/4 v4, 0x1

    move v3, v2

    move v2, v5

    :goto_2f
    add-int/2addr v3, v4

    move/from16 v8, p2

    move/from16 v4, v28

    move/from16 v5, v29

    goto/16 :goto_21

    :cond_41
    move/from16 v28, v4

    move/from16 v29, v5

    move v5, v2

    move v2, v1

    move v1, v0

    .line 153
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    if-lez v0, :cond_42

    invoke-virtual {v6, v9}, Landroidx/appcompat/widget/LinearLayoutCompat;->hasDividerBeforeChildAt(I)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 154
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mDividerWidth:I

    add-int/2addr v0, v3

    iput v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    :cond_42
    const/4 v0, 0x1

    .line 155
    aget v3, v13, v0

    const/4 v0, -0x1

    if-ne v3, v0, :cond_44

    const/4 v3, 0x0

    aget v4, v13, v3

    if-ne v4, v0, :cond_44

    aget v3, v13, v18

    if-ne v3, v0, :cond_44

    const/4 v3, 0x3

    aget v4, v13, v3

    if-eq v4, v0, :cond_43

    goto :goto_30

    :cond_43
    move v0, v5

    move/from16 v27, v15

    goto :goto_31

    :cond_44
    const/4 v3, 0x3

    .line 156
    :goto_30
    aget v0, v13, v3

    const/4 v4, 0x0

    aget v8, v13, v4

    const/16 v17, 0x1

    aget v4, v13, v17

    aget v3, v13, v18

    .line 157
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 158
    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 159
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v3, 0x3

    .line 160
    aget v4, v14, v3

    const/4 v3, 0x0

    aget v8, v14, v3

    aget v3, v14, v17

    move/from16 v27, v15

    aget v15, v14, v18

    .line 161
    invoke-static {v3, v15}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 162
    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 163
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/2addr v3, v0

    .line 164
    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_31
    if-eqz v28, :cond_49

    const/high16 v3, -0x80000000

    if-eq v10, v3, :cond_45

    if-nez v10, :cond_49

    :cond_45
    const/4 v3, 0x0

    .line 165
    iput v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    const/4 v4, 0x0

    :goto_32
    if-ge v4, v9, :cond_49

    .line 166
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_46

    .line 167
    iget v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->measureNullChild()I

    move-result v5

    add-int/2addr v3, v5

    iput v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_33

    .line 168
    :cond_46
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v8, 0x8

    if-ne v5, v8, :cond_47

    .line 169
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getChildrenSkipCount()I

    move-result v3

    add-int/2addr v4, v3

    goto :goto_33

    .line 170
    :cond_47
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    if-eqz v19, :cond_48

    .line 171
    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    iget v8, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v8, v12

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v8, v3

    .line 172
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v3

    add-int/2addr v8, v3

    add-int/2addr v8, v5

    iput v8, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_33

    .line 173
    :cond_48
    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    add-int v8, v5, v12

    .line 174
    iget v15, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v8, v15

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v8, v3

    .line 175
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v3

    add-int/2addr v8, v3

    .line 176
    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    :goto_33
    const/4 v3, 0x1

    add-int/2addr v4, v3

    goto :goto_32

    .line 177
    :cond_49
    iget v3, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v5

    add-int/2addr v5, v4

    add-int/2addr v5, v3

    iput v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 178
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v4, 0x0

    .line 179
    invoke-static {v3, v7, v4}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v3

    const v4, 0xffffff

    and-int/2addr v4, v3

    .line 180
    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    sub-int/2addr v4, v5

    if-nez v21, :cond_4e

    if-eqz v4, :cond_4a

    const/4 v8, 0x0

    cmpl-float v15, v25, v8

    if-lez v15, :cond_4a

    goto :goto_36

    .line 181
    :cond_4a
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-eqz v28, :cond_4d

    const/high16 v2, 0x40000000    # 2.0f

    if-eq v10, v2, :cond_4d

    const/4 v4, 0x0

    :goto_34
    if-ge v4, v9, :cond_4d

    .line 182
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_4c

    .line 183
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v10, 0x8

    if-ne v8, v10, :cond_4b

    goto :goto_35

    .line 184
    :cond_4b
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 185
    iget v8, v8, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/4 v10, 0x0

    cmpl-float v8, v8, v10

    if-lez v8, :cond_4c

    const/high16 v8, 0x40000000    # 2.0f

    .line 186
    invoke-static {v12, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 187
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    invoke-static {v13, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 188
    invoke-virtual {v2, v10, v13}, Landroid/view/View;->measure(II)V

    :cond_4c
    :goto_35
    add-int/lit8 v4, v4, 0x1

    goto :goto_34

    :cond_4d
    move/from16 v15, v27

    move/from16 v27, v9

    move/from16 v9, p2

    goto/16 :goto_44

    .line 189
    :cond_4e
    :goto_36
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mWeightSum:F

    const/4 v1, 0x0

    cmpl-float v8, v0, v1

    if-lez v8, :cond_4f

    move/from16 v25, v0

    :cond_4f
    const/4 v0, 0x3

    const/4 v1, -0x1

    .line 190
    aput v1, v13, v0

    aput v1, v13, v18

    const/4 v8, 0x1

    aput v1, v13, v8

    const/4 v12, 0x0

    aput v1, v13, v12

    .line 191
    aput v1, v14, v0

    aput v1, v14, v18

    aput v1, v14, v8

    aput v1, v14, v12

    .line 192
    iput v12, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    move v1, v2

    move v0, v4

    move/from16 v15, v27

    const/4 v2, -0x1

    const/4 v4, 0x0

    :goto_37
    if-ge v4, v9, :cond_5e

    .line 193
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_5d

    .line 194
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v12

    const/16 v5, 0x8

    if-ne v12, v5, :cond_50

    goto/16 :goto_41

    .line 195
    :cond_50
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;

    .line 196
    iget v5, v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->weight:F

    const/16 v20, 0x0

    cmpl-float v21, v5, v20

    if-lez v21, :cond_55

    int-to-float v7, v0

    mul-float/2addr v7, v5

    div-float v7, v7, v25

    float-to-int v7, v7

    sub-float v25, v25, v5

    sub-int/2addr v0, v7

    .line 197
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v21

    add-int v21, v21, v5

    iget v5, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int v21, v21, v5

    iget v5, v12, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int v5, v21, v5

    move/from16 v21, v0

    iget v0, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    move/from16 v27, v9

    move/from16 v9, p2

    .line 198
    invoke-static {v9, v5, v0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    .line 199
    iget v5, v12, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-nez v5, :cond_53

    const/high16 v5, 0x40000000    # 2.0f

    if-eq v10, v5, :cond_51

    goto :goto_39

    :cond_51
    if-lez v7, :cond_52

    goto :goto_38

    :cond_52
    const/4 v7, 0x0

    .line 200
    :goto_38
    invoke-static {v7, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    invoke-virtual {v8, v7, v0}, Landroid/view/View;->measure(II)V

    goto :goto_3a

    :cond_53
    const/high16 v5, 0x40000000    # 2.0f

    .line 201
    :goto_39
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v28

    add-int v7, v28, v7

    if-gez v7, :cond_54

    const/4 v7, 0x0

    .line 202
    :cond_54
    invoke-static {v7, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 203
    invoke-virtual {v8, v7, v0}, Landroid/view/View;->measure(II)V

    .line 204
    :goto_3a
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredState()I

    move-result v0

    const/high16 v5, -0x1000000

    and-int/2addr v0, v5

    .line 205
    invoke-static {v15, v0}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v15

    move/from16 v0, v21

    goto :goto_3b

    :cond_55
    move/from16 v27, v9

    move/from16 v9, p2

    :goto_3b
    if-eqz v19, :cond_56

    .line 206
    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    move/from16 v21, v0

    iget v0, v12, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v7, v0

    iget v0, v12, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v7, v0

    .line 207
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v0

    add-int/2addr v7, v0

    add-int/2addr v7, v5

    iput v7, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    goto :goto_3c

    :cond_56
    move/from16 v21, v0

    .line 208
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    .line 209
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    add-int/2addr v5, v0

    iget v7, v12, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v5, v7

    iget v7, v12, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v5, v7

    .line 210
    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/widget/LinearLayoutCompat;->getNextLocationOffset()I

    move-result v7

    add-int/2addr v5, v7

    .line 211
    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    :goto_3c
    const/high16 v0, 0x40000000    # 2.0f

    if-eq v11, v0, :cond_57

    .line 212
    iget v0, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v5, -0x1

    if-ne v0, v5, :cond_57

    const/4 v0, 0x1

    goto :goto_3d

    :cond_57
    const/4 v0, 0x0

    .line 213
    :goto_3d
    iget v5, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v7, v12, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v7

    .line 214
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v7, v5

    .line 215
    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-eqz v0, :cond_58

    goto :goto_3e

    :cond_58
    move v5, v7

    .line 216
    :goto_3e
    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-eqz v26, :cond_59

    .line 217
    iget v1, v12, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v5, -0x1

    if-ne v1, v5, :cond_5a

    const/4 v1, 0x1

    goto :goto_3f

    :cond_59
    const/4 v5, -0x1

    :cond_5a
    const/4 v1, 0x0

    :goto_3f
    if-eqz v29, :cond_5c

    .line 218
    invoke-virtual {v8}, Landroid/view/View;->getBaseline()I

    move-result v8

    if-eq v8, v5, :cond_5c

    .line 219
    iget v5, v12, Landroidx/appcompat/widget/LinearLayoutCompat$LayoutParams;->gravity:I

    if-gez v5, :cond_5b

    iget v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mGravity:I

    :cond_5b
    and-int/lit8 v5, v5, 0x70

    const/4 v12, 0x4

    shr-int/2addr v5, v12

    const/16 v24, -0x2

    and-int/lit8 v5, v5, -0x2

    const/16 v17, 0x1

    shr-int/lit8 v5, v5, 0x1

    .line 220
    aget v12, v13, v5

    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    move-result v12

    aput v12, v13, v5

    .line 221
    aget v12, v14, v5

    sub-int/2addr v7, v8

    invoke-static {v12, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    aput v7, v14, v5

    goto :goto_40

    :cond_5c
    const/16 v24, -0x2

    :goto_40
    move/from16 v26, v1

    move v1, v0

    move/from16 v0, v21

    goto :goto_42

    :cond_5d
    :goto_41
    move/from16 v27, v9

    const/16 v20, 0x0

    const/16 v24, -0x2

    move/from16 v9, p2

    :goto_42
    add-int/lit8 v4, v4, 0x1

    move/from16 v7, p1

    move/from16 v9, v27

    goto/16 :goto_37

    :cond_5e
    move/from16 v27, v9

    move/from16 v9, p2

    .line 222
    iget v0, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v5

    add-int/2addr v5, v4

    add-int/2addr v5, v0

    iput v5, v6, Landroidx/appcompat/widget/LinearLayoutCompat;->mTotalLength:I

    const/4 v0, 0x1

    .line 223
    aget v4, v13, v0

    const/4 v0, -0x1

    if-ne v4, v0, :cond_60

    const/4 v4, 0x0

    aget v5, v13, v4

    if-ne v5, v0, :cond_60

    aget v4, v13, v18

    if-ne v4, v0, :cond_60

    const/4 v4, 0x3

    aget v5, v13, v4

    if-eq v5, v0, :cond_5f

    goto :goto_43

    :cond_5f
    move v0, v2

    goto :goto_44

    :cond_60
    const/4 v4, 0x3

    .line 224
    :goto_43
    aget v0, v13, v4

    const/4 v5, 0x0

    aget v7, v13, v5

    const/4 v8, 0x1

    aget v10, v13, v8

    aget v12, v13, v18

    .line 225
    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 226
    invoke-static {v7, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 227
    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 228
    aget v4, v14, v4

    aget v5, v14, v5

    aget v7, v14, v8

    aget v8, v14, v18

    .line 229
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 230
    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 231
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/2addr v4, v0

    .line 232
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_44
    if-nez v26, :cond_61

    const/high16 v2, 0x40000000    # 2.0f

    if-eq v11, v2, :cond_61

    move v0, v1

    .line 233
    :cond_61
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    add-int/2addr v2, v1

    add-int/2addr v2, v0

    .line 234
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/high16 v1, -0x1000000

    and-int/2addr v1, v15

    or-int/2addr v1, v3

    shl-int/lit8 v2, v15, 0x10

    .line 235
    invoke-static {v0, v9, v2}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v0

    .line 236
    invoke-virtual {v6, v1, v0}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    if-eqz v23, :cond_62

    move/from16 v0, p1

    move/from16 v1, v27

    .line 237
    invoke-direct {v6, v1, v0}, Landroidx/appcompat/widget/LinearLayoutCompat;->forceUniformHeight(II)V

    :cond_62
    :goto_45
    return-void
.end method

.method public setBaselineAligned(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/widget/LinearLayoutCompat;->mBaselineAligned:Z

    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
