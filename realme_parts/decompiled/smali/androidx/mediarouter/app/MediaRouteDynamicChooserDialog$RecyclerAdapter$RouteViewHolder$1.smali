.class Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder$1;
.super Ljava/lang/Object;
.source "MediaRouteDynamicChooserDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$2:Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;

.field final synthetic val$route:Landroidx/mediarouter/media/MediaRouter$RouteInfo;


# direct methods
.method constructor <init>(Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;Landroidx/mediarouter/media/MediaRouter$RouteInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder$1;->this$2:Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;

    iput-object p2, p0, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder$1;->val$route:Landroidx/mediarouter/media/MediaRouter$RouteInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder$1;->val$route:Landroidx/mediarouter/media/MediaRouter$RouteInfo;

    invoke-virtual {p1}, Landroidx/mediarouter/media/MediaRouter$RouteInfo;->select()V

    .line 2
    iget-object p1, p0, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder$1;->this$2:Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;

    iget-object p1, p1, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;->mImageView:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3
    iget-object p0, p0, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder$1;->this$2:Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;

    iget-object p0, p0, Landroidx/mediarouter/app/MediaRouteDynamicChooserDialog$RecyclerAdapter$RouteViewHolder;->mProgressBar:Landroid/widget/ProgressBar;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
