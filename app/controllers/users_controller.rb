class UsersController < ApplicationController
    before_action :configure_post, except: [:index]
    before_action :authenticate_user!

  def index
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @review_from_me = PfReview.where(reviewer_user_id: current_user) #自分がしたレビュー
    @review_to_me = PfReview.where(reviewed_user_id: current_user) #自分のPFに対するレビュー
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
