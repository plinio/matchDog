class HomeController < ApplicationController
  
  def index
    @alvos = Dog.joins(:dono)
    @alvos = @alvos.joins("LEFT OUTER JOIN curtidas ON (curtidas.dog_alvo_id = dogs.id AND curtidas.dog_id = #{@current_dog.id})").where('curtidas.id is null')
    @alvos = @alvos.where("dono_id <> #{@current_dog.dono_id}")
    @alvos = @alvos.where(donos: {sexo: @current_faro.sexo_dono})
    @alvos = @alvos.where(sexo: @current_faro.sexo_dog) unless @current_faro.sexo_dog.nil?
    @alvos = @alvos.where(raca_id: @current_faro.raca_id) unless @current_faro.raca_id.nil?
    @alvos = @alvos.where(cidade_id: @current_faro.cidade_id) unless @current_faro.cidade_id.nil?
    @alvos = @alvos.where(interessa_passear: true) if @current_faro.interessa_passear.nil?
    @alvos = @alvos.where(interessa_cruzar: true) if @current_faro.interessa_cruzar.nil?
  end
  
  def farejar
    faro = Faro.new(faro_params)
    faro.dog_id = @current_dog.id
    faro.save
    @current_faro = faro
    
    redirect_to root_url
  end
  
  def curtir
    curtida = Curtida.new
    curtida.dog_id = @current_dog.id
    curtida.dog_alvo_id = params[:id]
    curtida.curtiu = params[:curtiu]
    curtida.save!
    
    #se gostou, tem que ver se deu match
    deumatch = false
    if curtida.curtiu
      curtida_correspondente = Curtida.where(dog_id: curtida.dog_alvo_id).where(dog_alvo_id: curtida.dog_id).where(curtiu: true).first
      if curtida_correspondente
        deumatch = true
        m = Match.new
        m.dog1_id = curtida_correspondente.dog_id
        m.dog2_id = curtida.dog_id
        m.save
      end
        
    end
    
    respond_to do |format|
      format.json { head :no_content } # 204 No Content
    end
  end
  
  private
  def faro_params
    params.required(:faro).permit(:sexo_dono,:sexo_dog,:raca_id,:cidade_id,:interessa_passear,:interessa_cruzar)
  end
  

end

