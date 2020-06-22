class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @musicposts = @user.musicposts.with_attached_audio.includes(:taxons)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.with_attached_avatar
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.with_attached_avatar
  end
end