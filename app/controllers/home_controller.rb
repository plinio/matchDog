class HomeController < ApplicationController
  
  def index
    @alvos = Dog.all
  end
  
  def farejar
    @faro = Faro.new(faro_params)
    @faro.dog_id = @current_dog.id
    @faro.save
    
    redirect_to root_url
  end
  
  def curtir
    @curtida = Curtida.new
    @curtida.dog_id = @current_dog.id
    @curtida.dog_alvo_id = params[:id]
    @curtida.curtiu = params[:curtiu]
    @curtida.save!
    
    #se gostou, tem que ver se deu match
    
    respond_to do |format|
      format.json { head :no_content } # 204 No Content
    end
  end
  
  private
  def faro_params
    params.required(:faro).permit(:sexo_dono,:sexo_dog,:raca_id,:cidade_id,:interessa_passear,:interessa_cruzar)
  end
  

end

