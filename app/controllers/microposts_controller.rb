class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to home_path
    else
      flash[:success] = "Cannot Post it time !"
      redirect_to home_path
    end
  end

  def index
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end