class LoginController < ApplicationController
  layout "initial"

  skip_before_filter :require_login
  skip_before_filter :require_cadastro_completo
  skip_before_filter :require_dog_selected
  

  def index
    
  end

  def create
    email = params[:email]
    password = Digest::MD5.hexdigest(params[:password])
    @dono = Dono.where(:email=>email).where(:password=>password).take
    unless @dono == nil
      session[:dono_id] = @dono.id
      session[:dog_id] = @dono.dogs.first.id if !@dono.dogs.empty? and @dono.dogs.length == 1
    end
    redirect_to root_url
  end

end
