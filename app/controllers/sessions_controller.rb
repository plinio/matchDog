class SessionsController < ApplicationController
  
  skip_before_filter :require_login
  skip_before_filter :require_cadastro_completo
  
  def create
    dono = Dono.omniauth(env['omniauth.auth'])
    session[:dono_id] = dono.id
    redirect_to root_url
  end

  def destroy
    session[:dono_id] = nil
    session[:dog_id] = nil
    redirect_to root_url
  end
end