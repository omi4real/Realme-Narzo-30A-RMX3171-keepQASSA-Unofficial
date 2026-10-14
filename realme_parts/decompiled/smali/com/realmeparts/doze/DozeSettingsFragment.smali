.class public Lcom/realmeparts/doze/DozeSettingsFragment;
.super Landroidx/preference/PreferenceFragment;
.source "DozeSettingsFragment.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/realmeparts/doze/DozeSettingsFragment$HelpDialogFragment;
    }
.end annotation


# instance fields
.field private mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

.field private final mHandler:Landroid/os/Handler;

.field private mHandwavePreference:Landroidx/preference/SwitchPreference;

.field private mPickUpPreference:Landroidx/preference/SwitchPreference;

.field private mPocketPreference:Landroidx/preference/SwitchPreference;

.field private mSwitchBar:Landroid/view/View;

.field private mTextView:Landroid/widget/TextView;

.field private mWakeOnGesturePreference:Landroidx/preference/SwitchPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/preference/PreferenceFragment;-><init>()V

    .line 2
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public synthetic lambda$onViewCreated$0$DozeSettingsFragment(Landroid/widget/Switch;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 2
    iget-object p0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mSwitchBar:Landroid/view/View;

    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "DOZE_ENABLED"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 3
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->checkDozeService(Landroid/content/Context;)V

    .line 4
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mTextView:Landroid/widget/TextView;

    if-eqz p2, :cond_0

    const v0, 0x7f100241

    goto :goto_0

    :cond_0
    const v0, 0x7f100240

    :goto_0
    invoke-virtual {p0, v0}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mSwitchBar:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setActivated(Z)V

    if-nez p2, :cond_1

    .line 6
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "DOZE_ALWAYS_ON"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 8
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 9
    :cond_1
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 10
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mWakeOnGesturePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 11
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mPickUpPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 12
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mHandwavePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 13
    iget-object p0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mPocketPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    return-void
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 7

    const/high16 p2, 0x7f130000

    .line 1
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->addPreferencesFromResource(I)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p2

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p2, v0}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 4
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const-string v0, "doze_settings"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    if-nez p1, :cond_0

    const-string p1, "first_help_shown"

    .line 5
    invoke-interface {p2, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    .line 6
    new-instance p1, Lcom/realmeparts/doze/DozeSettingsFragment$HelpDialogFragment;

    invoke-direct {p1}, Lcom/realmeparts/doze/DozeSettingsFragment$HelpDialogFragment;-><init>()V

    .line 7
    invoke-virtual {p0}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p2

    const-string v0, "help_dialog"

    invoke-virtual {p1, p2, v0}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/realmeparts/doze/DozeUtils;->isDozeEnabled(Landroid/content/Context;)Z

    move-result p1

    const-string p2, "wake_on_gesture"

    .line 9
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p2

    check-cast p2, Landroidx/preference/SwitchPreference;

    iput-object p2, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mWakeOnGesturePreference:Landroidx/preference/SwitchPreference;

    .line 10
    invoke-virtual {p2, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 11
    iget-object p2, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mWakeOnGesturePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p2, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string p2, "always_on_display"

    .line 12
    invoke-virtual {p0, p2}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/SwitchPreference;

    iput-object v0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

    .line 13
    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 14
    iget-object v0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/realmeparts/doze/DozeUtils;->isAlwaysOnEnabled(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 15
    iget-object v0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 16
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragment;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    const-string v2, "tilt_sensor"

    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    .line 17
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragment;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v2

    const-string v3, "proximity_sensor"

    invoke-virtual {v2, v3}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v2

    check-cast v2, Landroidx/preference/PreferenceCategory;

    const-string v3, "gesture_pick_up"

    .line 18
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    check-cast v3, Landroidx/preference/SwitchPreference;

    iput-object v3, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mPickUpPreference:Landroidx/preference/SwitchPreference;

    .line 19
    invoke-virtual {v3, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 20
    iget-object v3, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mPickUpPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {v3, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v3, "gesture_hand_wave"

    .line 21
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    check-cast v3, Landroidx/preference/SwitchPreference;

    iput-object v3, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mHandwavePreference:Landroidx/preference/SwitchPreference;

    .line 22
    invoke-virtual {v3, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 23
    iget-object v3, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mHandwavePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {v3, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    const-string v3, "gesture_pocket"

    .line 24
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    check-cast v3, Landroidx/preference/SwitchPreference;

    iput-object v3, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mPocketPreference:Landroidx/preference/SwitchPreference;

    .line 25
    invoke-virtual {v3, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 26
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mPocketPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 27
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v3, "com.android.systemui"

    .line 28
    :try_start_0
    invoke-virtual {p1, v3, v1}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "doze_proximity_check_before_pulse"

    const-string v6, "bool"

    invoke-virtual {v4, v5, v6, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    if-nez v1, :cond_1

    .line 31
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragment;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 32
    :cond_1
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    .line 33
    new-instance v1, Landroid/hardware/display/AmbientDisplayConfiguration;

    invoke-direct {v1, p1}, Landroid/hardware/display/AmbientDisplayConfiguration;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/hardware/display/AmbientDisplayConfiguration;->alwaysOnAvailable()Z

    move-result p1

    if-nez p1, :cond_2

    .line 34
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragment;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mAlwaysOnDisplayPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    .line 35
    :cond_2
    invoke-virtual {v0, p2}, Landroidx/preference/Preference;->setDependency(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v2, p2}, Landroidx/preference/Preference;->setDependency(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c0021

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 2
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-super {p0, p1, p2, p3}, Landroidx/preference/PreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x102002c

    if-ne p1, v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->onBackPressed()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v0, "always_on_display"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "DOZE_ALWAYS_ON"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mHandler:Landroid/os/Handler;

    new-instance p2, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$_gLgbiVd87uB41XPVIWUeTcdTbI;

    invoke-direct {p2, p0}, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$_gLgbiVd87uB41XPVIWUeTcdTbI;-><init>(Lcom/realmeparts/doze/DozeSettingsFragment;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/preference/PreferenceFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-static {p2}, Lcom/realmeparts/doze/DozeUtils;->isDozeEnabled(Landroid/content/Context;)Z

    move-result p2

    const v0, 0x7f090111

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mTextView:Landroid/widget/TextView;

    if-eqz p2, :cond_0

    const v1, 0x7f100241

    goto :goto_0

    :cond_0
    const v1, 0x7f100240

    .line 4
    :goto_0
    invoke-virtual {p0, v1}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f090110

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mSwitchBar:Landroid/view/View;

    const v0, 0x1020040

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    .line 7
    invoke-virtual {p1, p2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 8
    invoke-virtual {p1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 9
    iget-object v0, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mSwitchBar:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setActivated(Z)V

    .line 10
    iget-object p2, p0, Lcom/realmeparts/doze/DozeSettingsFragment;->mSwitchBar:Landroid/view/View;

    new-instance v0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;

    invoke-direct {v0, p0, p1}, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;-><init>(Lcom/realmeparts/doze/DozeSettingsFragment;Landroid/widget/Switch;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
