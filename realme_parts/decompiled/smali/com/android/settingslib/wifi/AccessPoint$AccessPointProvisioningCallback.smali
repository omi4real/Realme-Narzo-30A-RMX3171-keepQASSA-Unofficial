.class Lcom/android/settingslib/wifi/AccessPoint$AccessPointProvisioningCallback;
.super Landroid/net/wifi/hotspot2/ProvisioningCallback;
.source "AccessPoint.java"


# annotations
.annotation build Lcom/android/internal/annotations/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settingslib/wifi/AccessPoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AccessPointProvisioningCallback"
.end annotation


# virtual methods
.method public onProvisioningComplete()V
    .locals 0

    const/4 p0, 0x0

    .line 1
    throw p0
.end method

.method public onProvisioningFailure(I)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    throw p0
.end method

.method public onProvisioningStatus(I)V
    .locals 0

    const/4 p0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 1
    :pswitch_0
    throw p0

    .line 2
    :pswitch_1
    throw p0

    .line 3
    :goto_0
    throw p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
