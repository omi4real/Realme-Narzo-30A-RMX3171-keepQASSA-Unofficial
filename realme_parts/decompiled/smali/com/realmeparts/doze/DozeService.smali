.class public Lcom/realmeparts/doze/DozeService;
.super Landroid/app/Service;
.source "DozeService.java"


# instance fields
.field private mProximitySensor:Lcom/realmeparts/doze/ProximitySensor;

.field private final mScreenStateReceiver:Landroid/content/BroadcastReceiver;

.field private mTiltSensor:Lcom/realmeparts/doze/TiltSensor;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    new-instance v0, Lcom/realmeparts/doze/DozeService$1;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/DozeService$1;-><init>(Lcom/realmeparts/doze/DozeService;)V

    iput-object v0, p0, Lcom/realmeparts/doze/DozeService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static access$000(Lcom/realmeparts/doze/DozeService;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isPickUpEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/realmeparts/doze/DozeService;->mTiltSensor:Lcom/realmeparts/doze/TiltSensor;

    invoke-virtual {v0}, Lcom/realmeparts/doze/TiltSensor;->disable()V

    .line 4
    :cond_0
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isHandwaveGestureEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 5
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isPocketGestureEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/realmeparts/doze/DozeService;->mProximitySensor:Lcom/realmeparts/doze/ProximitySensor;

    invoke-virtual {p0}, Lcom/realmeparts/doze/ProximitySensor;->disable()V

    :cond_2
    return-void
.end method

.method static access$100(Lcom/realmeparts/doze/DozeService;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isPickUpEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/realmeparts/doze/DozeService;->mTiltSensor:Lcom/realmeparts/doze/TiltSensor;

    invoke-virtual {v0}, Lcom/realmeparts/doze/TiltSensor;->enable()V

    .line 4
    :cond_0
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isHandwaveGestureEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 5
    invoke-static {p0}, Lcom/realmeparts/doze/DozeUtils;->isPocketGestureEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/realmeparts/doze/DozeService;->mProximitySensor:Lcom/realmeparts/doze/ProximitySensor;

    invoke-virtual {p0}, Lcom/realmeparts/doze/ProximitySensor;->enable()V

    :cond_2
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 2

    .line 1
    new-instance v0, Lcom/realmeparts/doze/ProximitySensor;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/ProximitySensor;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/realmeparts/doze/DozeService;->mProximitySensor:Lcom/realmeparts/doze/ProximitySensor;

    .line 2
    new-instance v0, Lcom/realmeparts/doze/TiltSensor;

    invoke-direct {v0, p0}, Lcom/realmeparts/doze/TiltSensor;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/realmeparts/doze/DozeService;->mTiltSensor:Lcom/realmeparts/doze/TiltSensor;

    .line 3
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.SCREEN_OFF"

    .line 4
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 5
    iget-object v1, p0, Lcom/realmeparts/doze/DozeService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Landroid/app/Service;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 2
    iget-object v0, p0, Lcom/realmeparts/doze/DozeService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Landroid/app/Service;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 3
    iget-object v0, p0, Lcom/realmeparts/doze/DozeService;->mProximitySensor:Lcom/realmeparts/doze/ProximitySensor;

    invoke-virtual {v0}, Lcom/realmeparts/doze/ProximitySensor;->disable()V

    .line 4
    iget-object p0, p0, Lcom/realmeparts/doze/DozeService;->mTiltSensor:Lcom/realmeparts/doze/TiltSensor;

    invoke-virtual {p0}, Lcom/realmeparts/doze/TiltSensor;->disable()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
