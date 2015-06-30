class LoginController < ApplicationController
  layout "initial"

  skip_before_filter :require_login
  skip_before_filter :require_cadastro_completo

  def index
    
  end
  def new
    
  end

  def create
    email = params[:email]
    password = Digest::MD5.hexdigest(params[:password])
    @dono = Dono.where(:email=>email).where(:password=>password).take
    unless @dono == nil
      session[:user_id] = @dono.id
      session[:dog_id] = @dono.dogs.first.id
    end
    redirect_to root_url
  end

end
