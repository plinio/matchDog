class SessionsController < ApplicationController
  def create
    user = Dono.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end