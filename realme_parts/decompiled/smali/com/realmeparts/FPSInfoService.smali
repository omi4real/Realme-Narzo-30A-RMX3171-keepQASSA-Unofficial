.class public Lcom/realmeparts/FPSInfoService;
.super Landroid/app/Service;
.source "FPSInfoService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/realmeparts/FPSInfoService$CurFPSThread;,
        Lcom/realmeparts/FPSInfoService$FPSView;
    }
.end annotation


# static fields
.field private static final MEASURED_FPS:Ljava/lang/String; = "/dev/realme_fps"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mCurFPSThread:Ljava/lang/Thread;

.field private mDreamManager:Landroid/service/dreams/IDreamManager;

.field private mFps:Ljava/lang/String;

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private final mScreenStateReceiver:Landroid/content/BroadcastReceiver;

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const-string v0, "FPSInfoService"

    .line 2
    iput-object v0, p0, Lcom/realmeparts/FPSInfoService;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/realmeparts/FPSInfoService;->mFps:Ljava/lang/String;

    .line 4
    new-instance v0, Lcom/realmeparts/FPSInfoService$1;

    invoke-direct {v0, p0}, Lcom/realmeparts/FPSInfoService$1;-><init>(Lcom/realmeparts/FPSInfoService;)V

    iput-object v0, p0, Lcom/realmeparts/FPSInfoService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/realmeparts/FPSInfoService;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/realmeparts/FPSInfoService;->isDozeMode()Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/realmeparts/FPSInfoService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/realmeparts/FPSInfoService;->startThread()V

    return-void
.end method

.method static synthetic access$200(Lcom/realmeparts/FPSInfoService;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService;->mView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$300(Lcom/realmeparts/FPSInfoService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/realmeparts/FPSInfoService;->stopThread()V

    return-void
.end method

.method static synthetic access$400(Lcom/realmeparts/FPSInfoService;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService;->mFps:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$402(Lcom/realmeparts/FPSInfoService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/FPSInfoService;->mFps:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/realmeparts/FPSInfoService;->readOneLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private isDozeMode()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method private static readOneLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    const/16 p0, 0x200

    invoke-direct {v0, v1, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 4
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private startThread()V
    .locals 2

    const-string v0, "FPSInfoService"

    const-string v1, "started CurFPSThread"

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    new-instance v0, Lcom/realmeparts/FPSInfoService$CurFPSThread;

    iget-object v1, p0, Lcom/realmeparts/FPSInfoService;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/realmeparts/FPSInfoService$CurFPSThread;-><init>(Lcom/realmeparts/FPSInfoService;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/realmeparts/FPSInfoService;->mCurFPSThread:Ljava/lang/Thread;

    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private stopThread()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService;->mCurFPSThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "FPSInfoService"

    const-string v1, "stopping CurFPSThread"

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService;->mCurFPSThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService;->mCurFPSThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/realmeparts/FPSInfoService;->mCurFPSThread:Ljava/lang/Thread;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    :try_start_fg
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_fg

    new-instance v1, Landroid/app/NotificationChannel;

    const-string v2, "fps_info_channel"

    const-string v3, "FPS Overlay"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v0, Landroid/app/Notification$Builder;

    const-string v1, "fps_info_channel"

    invoke-direct {v0, p0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const-string v1, "FPS Overlay"

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    const v1, 0x7f070061

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    const/16 v1, 0x3e9

    invoke-virtual {p0, v1, v0}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    :try_end_fg
    .catchall {:try_start_fg .. :try_end_fg} :catch_fg

    :cond_fg
    :catch_fg
    new-instance v0, Lcom/realmeparts/FPSInfoService$FPSView;

    invoke-direct {v0, p0, p0}, Lcom/realmeparts/FPSInfoService$FPSView;-><init>(Lcom/realmeparts/FPSInfoService;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/realmeparts/FPSInfoService;->mView:Landroid/view/View;

    .line 3
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    const/16 v4, 0x7f6

    const/16 v5, 0x18

    const/4 v6, -0x3

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const/16 v1, 0x33

    .line 4
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const-string v1, "FPS Info"

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    invoke-direct {p0}, Lcom/realmeparts/FPSInfoService;->startThread()V

    const-string v1, "dreams"

    .line 7
    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 8
    invoke-static {v1}, Landroid/service/dreams/IDreamManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/service/dreams/IDreamManager;

    move-result-object v1

    iput-object v1, p0, Lcom/realmeparts/FPSInfoService;->mDreamManager:Landroid/service/dreams/IDreamManager;

    .line 9
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.action.SCREEN_OFF"

    .line 10
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 11
    iget-object v2, p0, Lcom/realmeparts/FPSInfoService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Landroid/app/Service;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const-string v1, "window"

    .line 12
    invoke-virtual {p0, v1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 13
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService;->mView:Landroid/view/View;

    invoke-interface {v1, p0, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 2
    invoke-direct {p0}, Lcom/realmeparts/FPSInfoService;->stopThread()V

    const-string v0, "window"

    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/realmeparts/FPSInfoService;->mView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    .line 4
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Landroid/app/Service;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(Z)V

    return-void
.end method
