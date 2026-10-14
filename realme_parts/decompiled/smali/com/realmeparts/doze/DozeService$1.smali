.class Lcom/realmeparts/doze/DozeService$1;
.super Landroid/content/BroadcastReceiver;
.source "DozeService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/realmeparts/doze/DozeService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/realmeparts/doze/DozeService;


# direct methods
.method constructor <init>(Lcom/realmeparts/doze/DozeService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/realmeparts/doze/DozeService$1;->this$0:Lcom/realmeparts/doze/DozeService;

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

    if-eqz p1, :cond_0

    .line 2
    iget-object p0, p0, Lcom/realmeparts/doze/DozeService$1;->this$0:Lcom/realmeparts/doze/DozeService;

    invoke-static {p0}, Lcom/realmeparts/doze/DozeService;->access$000(Lcom/realmeparts/doze/DozeService;)V

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 4
    iget-object p0, p0, Lcom/realmeparts/doze/DozeService$1;->this$0:Lcom/realmeparts/doze/DozeService;

    invoke-static {p0}, Lcom/realmeparts/doze/DozeService;->access$100(Lcom/realmeparts/doze/DozeService;)V

    :cond_1
    :goto_0
    return-void
.end method
