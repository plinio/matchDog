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
    else
      @current_user = Dono.find(session[:dono_id]) if session[:dono_id]
      if session[:dog_id]
        @current_dog = Dog.find(session[:dog_id]) 
        @current_faro = Faro.where("dog_id = #{@current_dog.id}").order("created_at DESC").first || create_initial_faro_to_current_dog()
      end
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
    else
      @current_user = Dono.find(session[:dono_id]) if session[:dono_id]
      @current_dog = Dog.find(session[:dog_id]) if session[:dog_id]
      @current_faro = Faro.where("dog_id = #{@current_dog.id}").order("created_at DESC").first || create_initial_faro_to_current_dog()
    end
  end
  
  private
  def create_initial_faro_to_current_dog()
    faro = Faro.new
    faro.sexo_dono          ||= @current_dog.dono.sexo == 'M' ? 'F' : 'M'
    faro.sexo_dog           ||= @current_dog.sexo == 'M' ? 'F' : 'M'
    faro.raca               ||= Raca.find(@current_dog.raca_id)
    faro.cidade             ||= Cidade.find(@current_dog.cidade_id)
    faro.interessa_passear  ||= @current_dog.interessa_passear
    faro.interessa_cruzar   ||= @current_dog.interessa_cruzar
    return faro
  end
  
  
end
