class UsersController < ApplicationController
  def index
    @user = User.new(params[:q])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @user }
    end
  end
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
