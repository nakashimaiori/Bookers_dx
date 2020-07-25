class UsersController < ApplicationController
  # correct_userはprivateの下で定義！
  before_action :correct_user, only: [:edit, :update]


  def show
  	@book =Book.new
  	@user = User.find(params[:id])
  	# 迷った↓
  	@books =@user.books.all
  end

  def edit
  	@user = User.find(params[:id])
    
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def index
  	@users =User.all
  	@user = current_user
  	@book =Book.new
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end
	def user_params
  		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
