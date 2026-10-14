.class public final synthetic Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$oXw6SA7rr6klItIH_TNqOPJQX9c;
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

    iput-object p1, p0, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$oXw6SA7rr6klItIH_TNqOPJQX9c;->f$0:Lcom/realmeparts/doze/ProximitySensor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    iget-object p0, p0, Lcom/realmeparts/doze/-$$Lambda$ProximitySensor$oXw6SA7rr6klItIH_TNqOPJQX9c;->f$0:Lcom/realmeparts/doze/ProximitySensor;

    invoke-virtual {p0}, Lcom/realmeparts/doze/ProximitySensor;->lambda$enable$0$ProximitySensor()V

    return-void
.end method
