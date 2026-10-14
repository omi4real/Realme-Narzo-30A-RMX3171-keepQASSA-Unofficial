.class public Lcom/realmeparts/HBMModeSwitch;
.super Ljava/lang/Object;
.source "HBMModeSwitch.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final FILE:Ljava/lang/String; = "/sys/kernel/oppo_display/hbm"

.field private static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sput-object p1, Lcom/realmeparts/HBMModeSwitch;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static TriggerService(ZLandroid/content/Context;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 1
    const-class p0, Lcom/realmeparts/HBMService;

    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->startService(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    :cond_0
    if-nez p0, :cond_1

    .line 2
    const-class p0, Lcom/realmeparts/HBMService;

    invoke-static {p1, p0}, Lcom/realmeparts/Utils;->stopService(Landroid/content/Context;Ljava/lang/Class;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static getFile()Ljava/lang/String;
    .locals 2

    const-string v0, "/sys/kernel/oppo_display/hbm"

    .line 1
    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static isCurrentlyEnabled(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/realmeparts/Utils;->getFileValueAsBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/realmeparts/Utils;->fileWritable(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Boolean;

    .line 2
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "1"

    goto :goto_0

    :cond_0
    const-string p1, "0"

    :goto_0
    invoke-static {p0, p1}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    sget-object p1, Lcom/realmeparts/HBMModeSwitch;->mContext:Landroid/content/Context;

    invoke-static {p0, p1}, Lcom/realmeparts/HBMModeSwitch;->TriggerService(ZLandroid/content/Context;)V

    const/4 p0, 0x1

    return p0
.end method
