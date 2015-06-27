class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :require_login
  
  before_filter :require_cadastro_completo
  
  private
  def require_login
    if session[:user_id] == nil
      redirect_to "/login"
    end
    @current_user = Dono.find(session[:user_id]) if session[:user_id]
  end
  
  private 
  def require_cadastro_completo
      redirect_to "/perfil" if (@current_user.sexo == "I" || @current_user.foto == nil || @current_user.foto == nil)
  end
  
  
end
