class SessionsController < ApplicationController
  def new
    session[:user] = nil
  end

  def create
    user = User.login(params[:username],params[:password])
    if user
      session[:user] = user
      redirect_to session[:return_to] || root_path
    else
      flash[:notice] = "Usuário ou senha inválidos"
      redirect_to new_session_path
    end
  end
end
