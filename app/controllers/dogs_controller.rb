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
    
    #Importar foto do Perfil
    if params.has_key?("foto")
      path = File.join(Rails.root + "public/images",params[:foto].original_filename)
      File.open(path,"wb") do |f|
        f.write(params[:foto].read) 
      end
    
      foto = Foto.new
      foto.url = params[:foto].original_filename
      foto.descricao = "Foto do Perfil"
      foto.save
      @dog.foto = foto
    end
    
    #Importar Demais fotos
    if params.has_key?("files")
      params['files'].each{ |file| 
        path = File.join(Rails.root + "public/images",file.original_filename)
        File.open(path,"wb") do |f|
          f.write(file.read) 
        end
      
        foto = Foto.new
        foto.url = file.original_filename
        foto.descricao = params['descricao_'+file.original_filename]
        foto.save
        @dog.fotos.append(foto)
      }
    end
    
    @dog.save
    flash[:notice] = "#{@dog.nome} foi cadastrado com sucesso."
    session[:dog_id] = @dog.id
    
    redirect_to dogs_url
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)

    #Importar foto do Perfil
    if params.has_key?("foto")
      path = File.join(Rails.root + "public/images",params[:foto].original_filename)
      File.open(path,"wb") do |f|
        f.write(params[:foto].read) 
      end
      
      if @dog.foto == nil 
        foto = Foto.new
      else
        foto = @dog.foto
      end
      foto.url = params[:foto].original_filename
      foto.descricao = "Foto do Perfil"
      foto.save
      @dog.foto = foto
    end
    
    #Importar Demais fotos
    if params.has_key?("files")
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
    end
    
    @dog.save
    flash[:notice] = "#{@dog.nome} foi Editado com sucesso."
    session[:dog_id] = @dog.id
    
    redirect_to dogs_url
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def destroy
    
    begin
      dog = Dog.find(params[:id])
      if dog.dono.id === @current_user.id
        dog.datahora_excluido = Time.now
        dog.save
        flash[:notice] = "O Dog "+dog.nome+"foi excluído!"
      end
    rescue
      flash[:notice] = "O Dog não pode ser excluído!"  
    end
    
    redirect_to dogs_url
  end

  def index
    @dogs = @current_user.dogs
  end

  def show
      dog = Dog.find(params[:id])
      if dog.dono.id === @current_user.id
        session[:dog_id] = dog.id
        redirect_to root_path
      else
        flash[:notice] = "O Dog não pode ser selecionado!"  
        redirect_to dogs_url  
      end
      
  end
  
  private
  def dog_params
    params.required(:dog).permit(:nome,:sexo,:raca_id,:cidade_id,:descricao_perfil,:tem_pedigree,:interessa_passear,:interessa_cruzar)
  end
  
end
