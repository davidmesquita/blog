class SessionsController < ApplicationController

  def create

    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      message = "Senha ou usuario invalidos"
      redirect_to login_path
    end
  end
end
