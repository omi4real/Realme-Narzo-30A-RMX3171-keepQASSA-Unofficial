.class Lcom/realmeparts/FPSInfoService$FPSView$1;
.super Landroid/os/Handler;
.source "FPSInfoService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/FPSInfoService$FPSView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/realmeparts/FPSInfoService$FPSView;


# direct methods
.method constructor <init>(Lcom/realmeparts/FPSInfoService$FPSView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView$1;->this$1:Lcom/realmeparts/FPSInfoService$FPSView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 3
    check-cast v0, Ljava/lang/String;

    const/4 p1, 0x0

    .line 4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x9

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {v0, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/realmeparts/FPSInfoService$FPSView$1;->this$1:Lcom/realmeparts/FPSInfoService$FPSView;

    iget-object v0, v0, Lcom/realmeparts/FPSInfoService$FPSView;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {v0, p1}, Lcom/realmeparts/FPSInfoService;->access$402(Lcom/realmeparts/FPSInfoService;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$FPSView$1;->this$1:Lcom/realmeparts/FPSInfoService$FPSView;

    invoke-static {p1, v1}, Lcom/realmeparts/FPSInfoService$FPSView;->access$502(Lcom/realmeparts/FPSInfoService$FPSView;Z)Z

    .line 7
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$FPSView$1;->this$1:Lcom/realmeparts/FPSInfoService$FPSView;

    invoke-virtual {p0}, Lcom/realmeparts/FPSInfoService$FPSView;->updateDisplay()V

    :cond_1
    return-void
.end method
