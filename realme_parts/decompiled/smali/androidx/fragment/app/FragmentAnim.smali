.class Landroidx/fragment/app/FragmentAnim;
.super Ljava/lang/Object;
.source "FragmentAnim.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/FragmentAnim$EndViewTransitionAnimation;,
        Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;
    }
.end annotation


# direct methods
.method static loadAnimation(Landroid/content/Context;Landroidx/fragment/app/Fragment;Z)Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;
    .locals 6

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->mAnimationInfo:Landroidx/fragment/app/Fragment$AnimationInfo;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    .line 2
    :cond_0
    iget v0, v0, Landroidx/fragment/app/Fragment$AnimationInfo;->mNextTransition:I

    .line 3
    :goto_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getNextAnim()I

    move-result v2

    .line 4
    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->setNextAnim(I)V

    .line 5
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    const v5, 0x7f09012e

    .line 6
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 7
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5, v4}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 8
    :cond_1
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v3

    if-eqz v3, :cond_2

    return-object v4

    .line 9
    :cond_2
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->onCreateAnimation()Landroid/view/animation/Animation;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 10
    new-instance p0, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {p0, v3}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/view/animation/Animation;)V

    return-object p0

    .line 11
    :cond_3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->onCreateAnimator()Landroid/animation/Animator;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 12
    new-instance p0, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {p0, p1}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/animation/Animator;)V

    return-object p0

    :cond_4
    if-eqz v2, :cond_8

    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object p1

    const-string v3, "anim"

    .line 14
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 15
    :try_start_0
    invoke-static {p0, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 16
    new-instance v5, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {v5, v3}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/view/animation/Animation;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    return-object v5

    :cond_5
    const/4 v1, 0x1

    goto :goto_1

    :catch_0
    move-exception p0

    .line 17
    throw p0

    :catch_1
    :cond_6
    :goto_1
    if-nez v1, :cond_8

    .line 18
    :try_start_1
    invoke-static {p0, v2}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 19
    new-instance v3, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {v3, v1}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/animation/Animator;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v3

    :catch_2
    move-exception v1

    if-nez p1, :cond_7

    .line 20
    invoke-static {p0, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    if-eqz p1, :cond_8

    .line 21
    new-instance p0, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-direct {p0, p1}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/view/animation/Animation;)V

    return-object p0

    .line 22
    :cond_7
    throw v1

    :cond_8
    if-nez v0, :cond_9

    return-object v4

    :cond_9
    const/16 p1, 0x1001

    if-eq v0, p1, :cond_e

    const/16 p1, 0x1003

    if-eq v0, p1, :cond_c

    const/16 p1, 0x2002

    if-eq v0, p1, :cond_a

    const/4 p1, -0x1

    goto :goto_2

    :cond_a
    if-eqz p2, :cond_b

    const p1, 0x7f010018

    goto :goto_2

    :cond_b
    const p1, 0x7f010019

    goto :goto_2

    :cond_c
    if-eqz p2, :cond_d

    const p1, 0x7f01001a

    goto :goto_2

    :cond_d
    const p1, 0x7f01001b

    goto :goto_2

    :cond_e
    if-eqz p2, :cond_f

    const p1, 0x7f01001d

    goto :goto_2

    :cond_f
    const p1, 0x7f01001e

    :goto_2
    if-gez p1, :cond_10

    return-object v4

    .line 23
    :cond_10
    new-instance p2, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;

    invoke-static {p0, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p0

    invoke-direct {p2, p0}, Landroidx/fragment/app/FragmentAnim$AnimationOrAnimator;-><init>(Landroid/view/animation/Animation;)V

    return-object p2
.end method
