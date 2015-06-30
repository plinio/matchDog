class CadastroController < ApplicationController
  layout "initial"
  
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
    
    
    @dono.password = Digest::MD5.hexdigest(@dono.password)
    @dono.save
    session[:user_id] = @dono.id
    redirect_to root_url
  end
  
  
  private
  def dono_params
    params.required(:dono).permit(:nome,:sexo,:email,:password)
  end
end
