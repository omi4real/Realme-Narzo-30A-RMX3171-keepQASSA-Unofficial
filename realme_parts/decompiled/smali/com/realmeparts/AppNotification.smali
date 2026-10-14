.class public Lcom/realmeparts/AppNotification;
.super Ljava/lang/Object;
.source "AppNotification.java"


# static fields
.field public static NotificationSent:Z

.field private static mNotificationChannel:Landroid/app/NotificationChannel;

.field private static mNotificationManager:Landroid/app/NotificationManager;

.field private static notification:Landroid/app/Notification;

.field private static notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Cancel(Landroid/content/Context;I)V
    .locals 1

    const-string v0, "notification"

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    sput-object p0, Lcom/realmeparts/AppNotification;->mNotificationManager:Landroid/app/NotificationManager;

    .line 2
    invoke-virtual {p0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method public static Send(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "notification"

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    sput-object v0, Lcom/realmeparts/AppNotification;->mNotificationManager:Landroid/app/NotificationManager;

    .line 2
    new-instance v0, Landroid/app/NotificationChannel;

    const/4 v1, 0x3

    invoke-direct {v0, p2, p2, v1}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    sput-object v0, Lcom/realmeparts/AppNotification;->mNotificationChannel:Landroid/app/NotificationChannel;

    .line 3
    sget-object v1, Lcom/realmeparts/AppNotification;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 4
    new-instance v0, Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f070096

    .line 5
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 6
    invoke-virtual {v0, p2}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 7
    invoke-virtual {v0, p3}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    const/4 p3, 0x1

    .line 8
    invoke-virtual {v0, p3}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 9
    invoke-virtual {v0, p2}, Landroidx/core/app/NotificationCompat$Builder;->setChannelId(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    sput-object v0, Lcom/realmeparts/AppNotification;->notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    .line 10
    new-instance p2, Landroid/content/Intent;

    const-class p3, Lcom/realmeparts/DeviceSettingsActivity;

    invoke-direct {p2, p0, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p3, 0x0

    const/high16 v0, 0x8000000

    .line 11
    invoke-static {p0, p3, p2, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 12
    sget-object p2, Lcom/realmeparts/AppNotification;->notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 13
    sget-object p0, Lcom/realmeparts/AppNotification;->notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    .line 14
    iget p2, p0, Landroid/app/Notification;->flags:I

    or-int/lit8 p2, p2, 0x20

    iput p2, p0, Landroid/app/Notification;->flags:I

    .line 15
    sget-object p2, Lcom/realmeparts/AppNotification;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {p2, p1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method
