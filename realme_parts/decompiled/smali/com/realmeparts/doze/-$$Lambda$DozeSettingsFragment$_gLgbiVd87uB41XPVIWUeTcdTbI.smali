.class public final synthetic Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$_gLgbiVd87uB41XPVIWUeTcdTbI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/realmeparts/doze/DozeSettingsFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/realmeparts/doze/DozeSettingsFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$_gLgbiVd87uB41XPVIWUeTcdTbI;->f$0:Lcom/realmeparts/doze/DozeSettingsFragment;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    iget-object p0, p0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$_gLgbiVd87uB41XPVIWUeTcdTbI;->f$0:Lcom/realmeparts/doze/DozeSettingsFragment;

    .line 1
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p0

    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->checkDozeService(Landroid/content/Context;)V

    return-void
.end method
