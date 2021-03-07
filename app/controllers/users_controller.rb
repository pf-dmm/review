class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @review_from_me = PfReview.where(reviewer_user_id: current_user) #自分のPFに対するレビュー
    @review_to_me = PfReview.where(reviewed_user_id: current_user) #自分がしたレビュー
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to "/"

  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
