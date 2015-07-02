class CadastroController < ApplicationController
  layout 'initial'
  
  skip_before_filter :require_login
  skip_before_filter :require_cadastro_completo
  
  def new
    
  end
  
  def save
    @dono =  Dono.new(dono_params)
    
    #Importar foto do Perfil
    path = File.join(Rails.root + "public/images",params[:foto].original_filename)
    File.open(path,"wb") do |f|
      f.write(params[:foto].read) 
    end
    
    foto = Foto.new
    foto.url = params[:foto].original_filename
    foto.descricao = "Foto do Perfil"
    foto.save
    @dono.foto = foto
    
    if params.has_key?("files")
      #Importar Demais fotos
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
  
  skip_before_filter :require_cadastro_completo
    
  def edit
      @dono = @current_user
  end
  
  def save2
      if params[:foto]
      path = File.join(Rails.root + "public/images",params[:foto].original_filename)
          File.open(path,"wb") do |f|
              f.write(params[:foto].read) 
          end
          if @current_user.foto == nil 
              foto = Foto.new
          else
              foto = @current_user.foto
          end
          foto.url = params[:foto].original_filename
          foto.descricao = "Foto do Perfil"
          foto.save
          @current_user.foto = foto
      end
      @current_user.sexo = params[:sexo]
      @current_user.save
      redirect_to root_path
  end
  
  
  
  private
  def dono_params
    params.required(:dono).permit(:nome,:sexo,:email,:password)
  end
  
  def resolve_layout
    case action_name
    when "edit"
      "application"
    else
      "initial"
    end
  end
end
