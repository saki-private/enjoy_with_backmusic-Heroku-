class FavoritesController < ApplicationController
  def index
    @musicposts = current_user.fav_musicposts
  end

  def create
    @musicpost = Musicpost.find(params[:musicpost_id])
    current_user.favorite(@musicpost)
    respond_to do |format|
      format.html { redirect_back_or root_url }
      format.js
    end
  end

  def destroy
    @musicpost = Favorite.find(params[:id]).musicpost
    current_user.unfavorite(@musicpost)
    respond_to do |format|
      format.html { redirect_back_or root_url }
      format.js
    end
  end
end