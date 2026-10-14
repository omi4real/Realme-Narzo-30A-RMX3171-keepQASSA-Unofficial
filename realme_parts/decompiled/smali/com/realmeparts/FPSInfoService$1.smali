.class Lcom/realmeparts/FPSInfoService$1;
.super Landroid/content/BroadcastReceiver;
.source "FPSInfoService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/FPSInfoService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/realmeparts/FPSInfoService;


# direct methods
.method constructor <init>(Lcom/realmeparts/FPSInfoService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.SCREEN_ON"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v0, "FPSInfoService"

    if-eqz p1, :cond_0

    const-string p1, "ACTION_SCREEN_ON "

    .line 2
    invoke-static {p1}, Lcom/android/tools/r8/GeneratedOutlineSupport;->outline2(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p2}, Lcom/realmeparts/FPSInfoService;->access$000(Lcom/realmeparts/FPSInfoService;)Z

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p1}, Lcom/realmeparts/FPSInfoService;->access$000(Lcom/realmeparts/FPSInfoService;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 4
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p1}, Lcom/realmeparts/FPSInfoService;->access$100(Lcom/realmeparts/FPSInfoService;)V

    .line 5
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p0}, Lcom/realmeparts/FPSInfoService;->access$200(Lcom/realmeparts/FPSInfoService;)Landroid/view/View;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "ACTION_SCREEN_OFF"

    .line 7
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    iget-object p1, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p1}, Lcom/realmeparts/FPSInfoService;->access$200(Lcom/realmeparts/FPSInfoService;)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 9
    iget-object p0, p0, Lcom/realmeparts/FPSInfoService$1;->this$0:Lcom/realmeparts/FPSInfoService;

    invoke-static {p0}, Lcom/realmeparts/FPSInfoService;->access$300(Lcom/realmeparts/FPSInfoService;)V

    :cond_1
    :goto_0
    return-void
.end method
