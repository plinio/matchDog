class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :require_login
  
  before_filter :require_cadastro_completo
  
  before_filter :require_dog_selected

  private
  def require_login
    if session[:dono_id] == nil
      redirect_to "/login"
    end
    
    @current_user = Dono.find(session[:dono_id]) if session[:dono_id]
    
    begin
      @current_dog = Dog.find(session[:dog_id]) if session[:dog_id]
    rescue ActiveRecord::RecordNotFound
      @current_dog = nil
    end
  end
  
  private 
  def require_cadastro_completo
    if (@current_user.sexo == "I" || @current_user.foto == nil || @current_user.foto == nil)
      redirect_to "/cadastro/complete" 
    else
      redirect_to "/cadastro/first_dog" if (@current_user.dogs.count == 0)
    end
  end
  
  private 
  def require_dog_selected
    if session[:dog_id] == nil
      redirect_to "/dogs"
    end
    
    @current_user = Dono.find(session[:dono_id]) if session[:dono_id]
    @current_dog = Dog.find(session[:dog_id]) if session[:dog_id]
    
  end
  
  
end
