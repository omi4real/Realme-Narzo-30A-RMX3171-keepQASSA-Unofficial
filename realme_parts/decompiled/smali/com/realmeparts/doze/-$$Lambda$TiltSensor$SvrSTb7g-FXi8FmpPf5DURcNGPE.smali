.class public final synthetic Lcom/realmeparts/doze/-$$Lambda$TiltSensor$SvrSTb7g-FXi8FmpPf5DURcNGPE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/realmeparts/doze/TiltSensor;


# direct methods
.method public synthetic constructor <init>(Lcom/realmeparts/doze/TiltSensor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/realmeparts/doze/-$$Lambda$TiltSensor$SvrSTb7g-FXi8FmpPf5DURcNGPE;->f$0:Lcom/realmeparts/doze/TiltSensor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    iget-object p0, p0, Lcom/realmeparts/doze/-$$Lambda$TiltSensor$SvrSTb7g-FXi8FmpPf5DURcNGPE;->f$0:Lcom/realmeparts/doze/TiltSensor;

    invoke-virtual {p0}, Lcom/realmeparts/doze/TiltSensor;->lambda$disable$1$TiltSensor()V

    return-void
.end method
