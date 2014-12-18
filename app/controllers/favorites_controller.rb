class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post_id: @post.id)
    if favorite.save
      flash[:notice] = "Added to favorites"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Please try again"
      redirect_to [@post.topic, @post]
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    if favorite.destroy
      flash[:notice] = "Removed from favorites"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Please try again"
      redirect_to [@post.topic, @post]
    end
end
end
