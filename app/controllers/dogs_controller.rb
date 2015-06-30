class DogsController < ApplicationController
  layout "application"
  
  skip_before_filter :require_cadastro_completo
  

  
  def new
    @cidades = Cidade.all.collect {|c| [c.nome,c.id]}
    @racas = Raca.all.collect {|c| [c.nome,c.id]}
  end

  def create
    @dog =  Dog.new(dog_params)
    @dog.dono_id = @current_user.id
    
    #Importar fotos
    params['files'].each{ |file| 
      path = File.join(Rails.root + "public/images",file.original_filename)
      File.open(path,"wb") do |f|
        f.write(file.read) 
      end
    
      foto = Foto.new
      foto.url = file.original_filename
      foto.descricao = "Foto Adicional"
      foto.save
      @dog.fotos.append(foto)
    }
    
    @dog.save
    flash[:notice] = "#{@dog.nome} foi cadastrado com sucesso."
    redirect_to "/dogs"
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @dogs = @current_user.dogs
  end

  def show
  end
  
  private
  def dog_params
    params.required(:dog).permit(:nome,:sexo,:raca_id,:cidade_id,:descricao_perfil,:tem_pedigree,:interessa_cruzar)
  end
end
