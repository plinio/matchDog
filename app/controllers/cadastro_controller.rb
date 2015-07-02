class CadastroController < ApplicationController
  layout :resolve_layout
  
  skip_before_filter :require_login, :only => [:new,:save]
  
  skip_before_filter :require_cadastro_completo
  
  def new
    
  end
  
  def save
    @dono =  Dono.new(dono_params)
    
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
      @dono.foto = foto
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
        @dono.fotos.append(foto)
      }
    end
    
    @dono.password = Digest::MD5.hexdigest(@dono.password)
    @dono.save
    session[:dono_id] = @dono.id
    redirect_to "/cadastro/first_dog"
  end
  
  def first_dog
    @cidades = Cidade.all.collect {|c| [c.nome,c.id]}
    @racas = Raca.all.collect {|c| [c.nome,c.id]}
  end
  

  def edit
    @dono = Dono.find(session[:dono_id])
  end
  
  def complete
    @dono = Dono.find(session[:dono_id])
  end
  
  def update
    @dono = Dono.find(session[:dono_id])
    @dono.update(dono_params)
      #Importar foto do Perfil
      if params.has_key?("foto")
        path = File.join(Rails.root + "public/images",params[:foto].original_filename)
        File.open(path,"wb") do |f|
          f.write(params[:foto].read) 
        end
        
        if @dono.foto == nil 
            foto = Foto.new
        else
            foto = @dono.foto
        end
        foto.url = params[:foto].original_filename
        foto.descricao = "Foto do Perfil"
        foto.save
        @dono.foto = foto
      end

      @dono.save
      flash[:notice] = "Seu Perfil foi Editado com sucesso."
      redirect_to root_path
  end
  
  
  
  private
  def dono_params
    params.required(:dono).permit(:nome,:sexo,:email,:password)
  end
  
  def resolve_layout
    case action_name
    when "edit"
      'application'
    else
      'initial'
    end
  end
end
