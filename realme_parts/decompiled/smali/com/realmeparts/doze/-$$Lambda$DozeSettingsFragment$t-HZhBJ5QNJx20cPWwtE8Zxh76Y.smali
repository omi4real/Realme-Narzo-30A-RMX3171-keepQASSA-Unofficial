.class public final synthetic Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/realmeparts/doze/DozeSettingsFragment;

.field public final synthetic f$1:Landroid/widget/Switch;


# direct methods
.method public synthetic constructor <init>(Lcom/realmeparts/doze/DozeSettingsFragment;Landroid/widget/Switch;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;->f$0:Lcom/realmeparts/doze/DozeSettingsFragment;

    iput-object p2, p0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;->f$1:Landroid/widget/Switch;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;->f$0:Lcom/realmeparts/doze/DozeSettingsFragment;

    iget-object p0, p0, Lcom/realmeparts/doze/-$$Lambda$DozeSettingsFragment$t-HZhBJ5QNJx20cPWwtE8Zxh76Y;->f$1:Landroid/widget/Switch;

    invoke-virtual {v0, p0, p1}, Lcom/realmeparts/doze/DozeSettingsFragment;->lambda$onViewCreated$0$DozeSettingsFragment(Landroid/widget/Switch;Landroid/view/View;)V

    return-void
.end method
