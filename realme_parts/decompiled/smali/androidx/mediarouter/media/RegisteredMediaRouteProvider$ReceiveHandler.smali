.class final Landroidx/mediarouter/media/RegisteredMediaRouteProvider$ReceiveHandler;
.super Landroid/os/Handler;
.source "RegisteredMediaRouteProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/mediarouter/media/RegisteredMediaRouteProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ReceiveHandler"
.end annotation


# instance fields
.field private final mConnectionRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$ReceiveHandler;->mConnectionRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$ReceiveHandler;->mConnectionRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 1
    iget-object p0, p0, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$ReceiveHandler;->mConnectionRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;

    if-eqz p0, :cond_8

    .line 2
    iget v0, p1, Landroid/os/Message;->what:I

    .line 3
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 4
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 5
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 6
    invoke-virtual {p1}, Landroid/os/Message;->peekData()Landroid/os/Bundle;

    move-result-object v4

    const/4 v5, 0x1

    const-string v6, "MediaRouteProviderProxy"

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    if-eqz v3, :cond_0

    .line 7
    instance-of v0, v3, Landroid/os/Bundle;

    if-eqz v0, :cond_7

    .line 8
    :cond_0
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {p0, v2, v3}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onDynamicRouteDescriptorsChanged(ILandroid/os/Bundle;)Z

    move-result v5

    goto :goto_2

    .line 9
    :pswitch_1
    instance-of v0, v3, Landroid/os/Bundle;

    if-eqz v0, :cond_1

    .line 10
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {p0, v1, v3}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onDynamicGroupRouteControllerCreated(ILandroid/os/Bundle;)V

    goto :goto_1

    :cond_1
    const-string p0, "No further information on the dynamic group controller"

    .line 11
    invoke-static {v6, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :pswitch_2
    if-eqz v3, :cond_2

    .line 12
    instance-of v0, v3, Landroid/os/Bundle;

    if-eqz v0, :cond_7

    .line 13
    :cond_2
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {p0, v3}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onDescriptorChanged(Landroid/os/Bundle;)Z

    move-result v5

    goto :goto_2

    :pswitch_3
    if-eqz v3, :cond_3

    .line 14
    instance-of v0, v3, Landroid/os/Bundle;

    if-eqz v0, :cond_7

    :cond_3
    if-nez v4, :cond_4

    const/4 v0, 0x0

    goto :goto_0

    :cond_4
    const-string v0, "error"

    .line 15
    invoke-virtual {v4, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 16
    :goto_0
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {p0, v1, v0, v3}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onControlRequestFailed(ILjava/lang/String;Landroid/os/Bundle;)Z

    move-result v5

    goto :goto_2

    :pswitch_4
    if-eqz v3, :cond_5

    .line 17
    instance-of v0, v3, Landroid/os/Bundle;

    if-eqz v0, :cond_7

    .line 18
    :cond_5
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {p0, v1, v3}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onControlRequestSucceeded(ILandroid/os/Bundle;)Z

    move-result v5

    goto :goto_2

    :pswitch_5
    if-eqz v3, :cond_6

    .line 19
    instance-of v0, v3, Landroid/os/Bundle;

    if-eqz v0, :cond_7

    .line 20
    :cond_6
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {p0, v1, v2, v3}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onRegistered(IILandroid/os/Bundle;)Z

    move-result v5

    goto :goto_2

    .line 21
    :pswitch_6
    invoke-virtual {p0, v1}, Landroidx/mediarouter/media/RegisteredMediaRouteProvider$Connection;->onGenericFailure(I)Z

    goto :goto_2

    :cond_7
    :goto_1
    const/4 v5, 0x0

    :goto_2
    :pswitch_7
    if-nez v5, :cond_8

    .line 22
    sget-boolean p0, Landroidx/mediarouter/media/RegisteredMediaRouteProvider;->DEBUG:Z

    if-eqz p0, :cond_8

    .line 23
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unhandled message from server: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_7
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
