class SessionsController < ApplicationController
  
  skip_before_filter :require_login
  skip_before_filter :require_cadastro_completo
  skip_before_filter :require_dog_selected
  
  def create
    dono = Dono.omniauth(env['omniauth.auth'])
    session[:dono_id] = dono.id
    session[:dog_id] = dono.dogs.first.id if !dono.dogs.empty?
    redirect_to root_url
  end

  def destroy
    session[:dono_id] = nil
    session[:dog_id] = nil
    redirect_to root_url
  end
end