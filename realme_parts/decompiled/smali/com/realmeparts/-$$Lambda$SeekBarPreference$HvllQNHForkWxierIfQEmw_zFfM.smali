.class public final synthetic Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/realmeparts/SeekBarPreference;

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/realmeparts/SeekBarPreference;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;->f$0:Lcom/realmeparts/SeekBarPreference;

    iput-object p2, p0, Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;->f$0:Lcom/realmeparts/SeekBarPreference;

    iget-object p0, p0, Lcom/realmeparts/-$$Lambda$SeekBarPreference$HvllQNHForkWxierIfQEmw_zFfM;->f$1:Landroid/view/View;

    invoke-virtual {v0, p0}, Lcom/realmeparts/SeekBarPreference;->lambda$onBindViewHolder$0$SeekBarPreference(Landroid/view/View;)V

    return-void
.end method
