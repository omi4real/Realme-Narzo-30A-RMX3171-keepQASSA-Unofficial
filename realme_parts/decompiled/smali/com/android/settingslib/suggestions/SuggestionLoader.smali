.class public Lcom/android/settingslib/suggestions/SuggestionLoader;
.super Lcom/android/settingslib/utils/AsyncLoader;
.source "SuggestionLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/settingslib/utils/AsyncLoader<",
        "Ljava/util/List<",
        "Landroid/service/settings/suggestions/Suggestion;",
        ">;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final mSuggestionController:Lcom/android/settingslib/suggestions/SuggestionController;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    const/4 p1, 0x0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/settingslib/utils/AsyncLoader;-><init>(Landroid/content/Context;)V

    .line 2
    iput-object p1, p0, Lcom/android/settingslib/suggestions/SuggestionLoader;->mSuggestionController:Lcom/android/settingslib/suggestions/SuggestionController;

    return-void
.end method


# virtual methods
.method public loadInBackground()Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    .line 1
    throw p0
.end method

.method protected onDiscardResult(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    return-void
.end method
