.class public Lcom/realmeparts/doze/DozeSettingsActivity;
.super Landroid/preference/PreferenceActivity;
.source "DozeSettingsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    new-instance p1, Lcom/realmeparts/doze/DozeSettingsFragment;

    invoke-direct {p1}, Lcom/realmeparts/doze/DozeSettingsFragment;-><init>()V

    const v0, 0x1020002

    const-string v1, "doze"

    invoke-virtual {p0, v0, p1, v1}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p0

    .line 3
    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method
