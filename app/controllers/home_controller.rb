class HomeController < ApplicationController
  
  def index
    
  end
  
  def farejar
    @faro = Faro.new(faro_params)
    @faro.dog_id = @current_dog.id
    @faro.save
    
    redirect_to root_url
  end
  
  private
  def faro_params
    params.required(:faro).permit(:sexo_dono,:sexo_dog,:raca_id,:cidade_id,:interessa_passear,:interessa_cruzar)
  end
  

end

