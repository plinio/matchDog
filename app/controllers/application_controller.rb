class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :require_login
  
  before_filter :require_cadastro_completo
  
  before_filter :require_dog_selected
  
  after_filter :flash_to_headers

  private
  def require_login
    if session[:dono_id] == nil
      flash[:warning] = "Faça login para continuar."
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
    if (@current_user.sexo == "I")
      flash[:warning] = "Você precisa completar seu cadastro."
      redirect_to "/cadastro/complete" 
    else
      if (@current_user.dogs.empty?)
        flash[:warning] = "Você precisa cadastrar seu primeiro Dog."
        redirect_to "/cadastro/first_dog" if (@current_user.dogs.count == 0)
      end
    end
  end
  
  private 
  def require_dog_selected
    if session[:dog_id] == nil
      flash[:warning] = "Selecione para qual Dog deseja encontrar um par."
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
  
  
  
  private 

  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash_message
    response.headers["X-Message-Type"] = flash_type.to_s

    flash.discard # don't want the flash to appear when you reload page
  end

  def flash_message
    [:error, :warning, :notice, :success].each do |type|
      return flash[type] unless flash[type].blank?
    end
  end

  def flash_type
    [:error, :warning, :notice, :success].each do |type|
      return type unless flash[type].blank?
    end
  end
  
  
end
