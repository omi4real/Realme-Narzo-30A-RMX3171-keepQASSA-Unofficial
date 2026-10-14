.class public Lcom/realmeparts/FPSInfoService$CurFPSThread;
.super Ljava/lang/Thread;
.source "FPSInfoService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/FPSInfoService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CurFPSThread"
.end annotation


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private mInterrupt:Z

.field final synthetic this$0:Lcom/realmeparts/FPSInfoService;


# direct methods
.method public constructor <init>(Lcom/realmeparts/FPSInfoService;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->mInterrupt:Z

    .line 3
    iput-object p2, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public interrupt()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->mInterrupt:Z

    return-void
.end method

.method public run()V
    .locals 4

    :goto_0
    iget-boolean v0, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->mInterrupt:Z

    if-nez v0, :cond_exit

    :try_start_loop
    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    const-string v0, "/dev/realme_fps"

    invoke-static {v0}, Lcom/realmeparts/FPSInfoService;->access$600(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_got_fps

    const-string v0, "60"

    :cond_got_fps
    iget-object v1, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->mHandler:Landroid/os/Handler;

    if-nez v1, :cond_got_handler

    iget-object v1, p0, Lcom/realmeparts/FPSInfoService$CurFPSThread;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {v1}, Lcom/realmeparts/FPSInfoService;->access$200(Lcom/realmeparts/FPSInfoService;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_goto

    invoke-virtual {v1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v1

    :cond_got_handler
    if-eqz v1, :cond_goto

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_goto
    :try_end_loop
    .catch Ljava/lang/InterruptedException; {:try_start_loop .. :try_end_loop} :catch_interrupted
    .catch Ljava/lang/Throwable; {:try_start_loop .. :try_end_loop} :catch_other

    goto :goto_0

    :catch_other
    goto :goto_0

    :catch_interrupted
    :cond_exit
    return-void
.end method
