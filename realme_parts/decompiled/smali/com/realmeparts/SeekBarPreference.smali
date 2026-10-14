.class public Lcom/realmeparts/SeekBarPreference;
.super Landroidx/preference/Preference;
.source "SeekBarPreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/realmeparts/SeekBarPreference$SavedState;
    }
.end annotation


# static fields
.field public static mProgress:I


# instance fields
.field private mContinuousUpdates:Z

.field private mDefaultProgress:I

.field private mMax:I

.field private mMin:I

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mSeekBarContentDescription:Ljava/lang/CharSequence;

.field private mSelected_Value:Landroid/widget/TextView;

.field private mShouldBlink:Z

.field private mTrackingTouch:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/realmeparts/SeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const v0, 0x7f03011b

    const v1, 0x11200cf

    .line 12
    invoke-static {p1, v0, v1}, Landroidx/core/content/res/FontResourcesParserCompat;->getAttr(Landroid/content/Context;II)I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/realmeparts/SeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/realmeparts/SeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/realmeparts/SeekBarPreference;->mDefaultProgress:I

    .line 3
    sget-object v0, Lcom/android/internal/R$styleable;->ProgressBar:[I

    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 4
    iget v1, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/realmeparts/SeekBarPreference;->setMax(I)V

    .line 5
    iget v1, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    const/16 v2, 0x1a

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/realmeparts/SeekBarPreference;->setMin(I)V

    .line 6
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    const p1, 0x7f0c0057

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method

.method public static getProgress()I
    .locals 1

    .line 1
    sget v0, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    return v0
.end method

.method private setProgress(IZ)V
    .locals 1

    .line 2
    iget v0, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    if-le p1, v0, :cond_0

    move p1, v0

    .line 3
    :cond_0
    iget v0, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    if-ge p1, v0, :cond_1

    move p1, v0

    .line 4
    :cond_1
    sget v0, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    if-eq p1, v0, :cond_2

    .line 5
    sput p1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    .line 6
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->persistInt(I)Z

    if-eqz p2, :cond_2

    .line 7
    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    :cond_2
    return-void
.end method


# virtual methods
.method public getMax()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    return p0
.end method

.method public getMin()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    return p0
.end method

.method public getSummary()Ljava/lang/CharSequence;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public synthetic lambda$onBindViewHolder$0$SeekBarPreference(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    int-to-float v0, v0

    int-to-float v1, v1

    invoke-virtual {v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    :cond_0
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 7
    iput-boolean v0, p0, Lcom/realmeparts/SeekBarPreference;->mShouldBlink:Z

    return-void
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 2
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    const v0, 0x7f0900f6

    .line 3
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    .line 4
    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 5
    iget-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 6
    iget-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMin(I)V

    .line 7
    iget-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    sget v1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 8
    iget-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {p0}, Landroidx/preference/Preference;->isEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    const v0, 0x7f0900f9

    .line 9
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSelected_Value:Landroid/widget/TextView;

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/realmeparts/SeekBarPreference;->getProgress()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    invoke-virtual {p0}, Landroidx/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBarContentDescription:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 13
    iget-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBarContentDescription:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 14
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 15
    iget-object v1, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 16
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    instance-of v1, v0, Lcom/realmeparts/DefaultIndicatorSeekBar;

    if-eqz v1, :cond_2

    .line 17
    check-cast v0, Lcom/realmeparts/DefaultIndicatorSeekBar;

    iget v1, p0, Lcom/realmeparts/SeekBarPreference;->mDefaultProgress:I

    invoke-virtual {v0, v1}, Lcom/realmeparts/DefaultIndicatorSeekBar;->setDefaultProgress(I)V

    .line 18
    :cond_2
    iget-boolean v0, p0, Lcom/realmeparts/SeekBarPreference;->mShouldBlink:Z

    if-eqz v0, :cond_3

    .line 19
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 20
    new-instance v0, Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;

    invoke-direct {v0, p0, p1}, Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;-><init>(Lcom/realmeparts/SeekBarPreference;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_3
    return-void
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-virtual {p1, p2, p0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const p0, 0x7f0900f6

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/SeekBar;

    if-nez p0, :cond_1

    return v0

    .line 3
    :cond_1
    invoke-virtual {p0, p2, p3}, Landroid/widget/SeekBar;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_1

    .line 1
    iget-boolean p2, p0, Lcom/realmeparts/SeekBarPreference;->mContinuousUpdates:Z

    if-nez p2, :cond_0

    iget-boolean p2, p0, Lcom/realmeparts/SeekBarPreference;->mTrackingTouch:Z

    if-nez p2, :cond_1

    .line 2
    :cond_0
    invoke-virtual {p0, p1}, Lcom/realmeparts/SeekBarPreference;->syncProgress(Landroid/widget/SeekBar;)V

    :cond_1
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/realmeparts/SeekBarPreference$SavedState;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_0
    check-cast p1, Lcom/realmeparts/SeekBarPreference$SavedState;

    .line 4
    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroidx/preference/Preference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget v0, p1, Lcom/realmeparts/SeekBarPreference$SavedState;->progress:I

    sput v0, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    .line 6
    iget v0, p1, Lcom/realmeparts/SeekBarPreference$SavedState;->max:I

    iput v0, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    .line 7
    iget p1, p1, Lcom/realmeparts/SeekBarPreference$SavedState;->min:I

    iput p1, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    .line 8
    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/preference/Preference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroidx/preference/Preference;->isPersistent()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 3
    :cond_0
    new-instance v1, Lcom/realmeparts/SeekBarPreference$SavedState;

    invoke-direct {v1, v0}, Lcom/realmeparts/SeekBarPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 4
    sget v0, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    iput v0, v1, Lcom/realmeparts/SeekBarPreference$SavedState;->progress:I

    .line 5
    iget v0, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    iput v0, v1, Lcom/realmeparts/SeekBarPreference$SavedState;->max:I

    .line 6
    iget p0, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    iput p0, v1, Lcom/realmeparts/SeekBarPreference$SavedState;->min:I

    return-object v1
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    sget p1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->getPersistedInt(I)I

    move-result p1

    goto :goto_0

    .line 2
    :cond_0
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/realmeparts/SeekBarPreference;->setProgress(I)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lcom/realmeparts/SeekBarPreference;->mTrackingTouch:Z

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Lcom/realmeparts/SeekBarPreference;->mTrackingTouch:Z

    .line 2
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    sget v1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    if-eq v0, v1, :cond_0

    .line 3
    invoke-virtual {p0, p1}, Lcom/realmeparts/SeekBarPreference;->syncProgress(Landroid/widget/SeekBar;)V

    .line 4
    iget-object p1, p0, Lcom/realmeparts/SeekBarPreference;->mSelected_Value:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 6
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    sget p1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    const-string v0, "seek_bar"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Charging limit set at "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DeviceSettings"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public setContinuousUpdates(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/realmeparts/SeekBarPreference;->mContinuousUpdates:Z

    return-void
.end method

.method public setDefaultProgress(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/realmeparts/SeekBarPreference;->mDefaultProgress:I

    if-eq v0, p1, :cond_0

    .line 2
    iput p1, p0, Lcom/realmeparts/SeekBarPreference;->mDefaultProgress:I

    .line 3
    iget-object p0, p0, Lcom/realmeparts/SeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    instance-of v0, p0, Lcom/realmeparts/DefaultIndicatorSeekBar;

    if-eqz v0, :cond_0

    .line 4
    check-cast p0, Lcom/realmeparts/DefaultIndicatorSeekBar;

    invoke-virtual {p0, p1}, Lcom/realmeparts/DefaultIndicatorSeekBar;->setDefaultProgress(I)V

    :cond_0
    return-void
.end method

.method public setMax(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    if-eq p1, v0, :cond_0

    .line 2
    iput p1, p0, Lcom/realmeparts/SeekBarPreference;->mMax:I

    .line 3
    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    :cond_0
    return-void
.end method

.method public setMin(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    if-eq p1, v0, :cond_0

    .line 2
    iput p1, p0, Lcom/realmeparts/SeekBarPreference;->mMin:I

    .line 3
    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    :cond_0
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/realmeparts/SeekBarPreference;->setProgress(IZ)V

    return-void
.end method

.method public setShouldBlink(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/realmeparts/SeekBarPreference;->mShouldBlink:Z

    .line 2
    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    return-void
.end method

.method syncProgress(Landroid/widget/SeekBar;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 2
    sget v1, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    if-eq v0, v1, :cond_1

    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/preference/Preference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, v0, p1}, Lcom/realmeparts/SeekBarPreference;->setProgress(IZ)V

    goto :goto_0

    .line 5
    :cond_0
    sget p0, Lcom/realmeparts/SeekBarPreference;->mProgress:I

    invoke-virtual {p1, p0}, Landroid/widget/SeekBar;->setProgress(I)V

    :cond_1
    :goto_0
    return-void
.end method
