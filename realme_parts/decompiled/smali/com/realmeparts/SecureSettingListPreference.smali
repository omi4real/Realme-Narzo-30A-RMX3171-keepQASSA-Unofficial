.class public Lcom/realmeparts/SecureSettingListPreference;
.super Landroidx/preference/ListPreference;
.source "SecureSettingListPreference.java"


# instance fields
.field private mAutoSummary:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 7
    invoke-direct {p0, p1}, Landroidx/preference/ListPreference;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/realmeparts/SecureSettingListPreference;->mAutoSummary:Z

    .line 9
    new-instance v0, Lcom/realmeparts/SecureSettingsStore;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/realmeparts/SecureSettingsStore;-><init>(Landroid/content/ContentResolver;)V

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setPreferenceDataStore(Landroidx/preference/PreferenceDataStore;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1, p2}, Landroidx/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/realmeparts/SecureSettingListPreference;->mAutoSummary:Z

    .line 6
    new-instance p2, Lcom/realmeparts/SecureSettingsStore;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/realmeparts/SecureSettingsStore;-><init>(Landroid/content/ContentResolver;)V

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setPreferenceDataStore(Landroidx/preference/PreferenceDataStore;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Lcom/realmeparts/SecureSettingListPreference;->mAutoSummary:Z

    .line 3
    new-instance p2, Lcom/realmeparts/SecureSettingsStore;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/realmeparts/SecureSettingsStore;-><init>(Landroid/content/ContentResolver;)V

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setPreferenceDataStore(Landroidx/preference/PreferenceDataStore;)V

    return-void
.end method

.method private setSummary(Ljava/lang/CharSequence;Z)V
    .locals 0

    .line 2
    iput-boolean p2, p0, Lcom/realmeparts/SecureSettingListPreference;->mAutoSummary:Z

    .line 3
    invoke-super {p0, p1}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->getPersistedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, p2

    check-cast p1, Ljava/lang/String;

    :goto_0
    invoke-virtual {p0, p1}, Lcom/realmeparts/SecureSettingListPreference;->setValue(Ljava/lang/String;)V

    return-void
.end method

.method public setSummary(Ljava/lang/CharSequence;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/realmeparts/SecureSettingListPreference;->setSummary(Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 2
    iget-boolean p1, p0, Lcom/realmeparts/SecureSettingListPreference;->mAutoSummary:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroidx/preference/ListPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/realmeparts/SecureSettingListPreference;->setSummary(Ljava/lang/CharSequence;Z)V

    :cond_1
    return-void
.end method
