class UsersController < ApplicationController
  def create
    @user = User.new(user_params) # @user = User.new(params[:user]) 
    if @user.save
      flash[:success] = "Welcome to the Brillio App!"
      redirect_to @user # equivalent to redirect_to user_url(@user)
      #Handle a sucessful signup
    else 
      render 'new'
    end
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
 private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
