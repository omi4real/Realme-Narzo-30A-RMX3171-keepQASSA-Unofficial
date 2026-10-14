.class Lcom/realmeparts/HBMService$1;
.super Landroid/content/BroadcastReceiver;
.source "HBMService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/HBMService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/realmeparts/HBMService;


# direct methods
.method constructor <init>(Lcom/realmeparts/HBMService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/HBMService$1;->this$0:Lcom/realmeparts/HBMService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DeviceSettings"

    const-string v0, "android.intent.action.USER_PRESENT"

    if-ne p0, v0, :cond_0

    .line 2
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    const-string p2, "1"

    invoke-static {p0, p2}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "HBM Enabled"

    .line 3
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    const-string p2, "android.intent.action.SCREEN_OFF"

    if-ne p0, p2, :cond_1

    .line 5
    invoke-static {}, Lcom/realmeparts/HBMModeSwitch;->getFile()Ljava/lang/String;

    move-result-object p0

    const-string p2, "0"

    invoke-static {p0, p2}, Lcom/realmeparts/Utils;->writeValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "HBM Disabled"

    .line 6
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method
