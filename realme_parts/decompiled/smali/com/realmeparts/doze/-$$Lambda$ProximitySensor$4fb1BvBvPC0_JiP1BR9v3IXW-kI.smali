.class public final synthetic Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$4fb1BvBvPC0_JiP1BR9v3IXW-kI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/realmeparts/doze/ProximitySensor;


# direct methods
.method public synthetic constructor <init>(Lcom/realmeparts/doze/ProximitySensor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$4fb1BvBvPC0_JiP1BR9v3IXW-kI;->f$0:Lcom/realmeparts/doze/ProximitySensor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    iget-object p0, p0, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$4fb1BvBvPC0_JiP1BR9v3IXW-kI;->f$0:Lcom/realmeparts/doze/ProximitySensor;

    invoke-virtual {p0}, Lcom/realmeparts/doze/ProximitySensor;->lambda$disable$1$ProximitySensor()V

    return-void
.end method
