.class public Lcom/realmeparts/DeviceSettingsActivity;
.super Landroid/app/Activity;
.source "DeviceSettingsActivity.java"


# instance fields
.field private mDeviceSettingsFragment:Lcom/realmeparts/DeviceSettings;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_0

    .line 4
    new-instance p1, Lcom/realmeparts/DeviceSettings;

    invoke-direct {p1}, Lcom/realmeparts/DeviceSettings;-><init>()V

    iput-object p1, p0, Lcom/realmeparts/DeviceSettingsActivity;->mDeviceSettingsFragment:Lcom/realmeparts/DeviceSettings;

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    iget-object p0, p0, Lcom/realmeparts/DeviceSettingsActivity;->mDeviceSettingsFragment:Lcom/realmeparts/DeviceSettings;

    .line 6
    invoke-virtual {p1, v0, p0}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commit()I

    goto :goto_0

    .line 8
    :cond_0
    check-cast p1, Lcom/realmeparts/DeviceSettings;

    iput-object p1, p0, Lcom/realmeparts/DeviceSettingsActivity;->mDeviceSettingsFragment:Lcom/realmeparts/DeviceSettings;

    :goto_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p0, 0x1

    return p0
.end method
