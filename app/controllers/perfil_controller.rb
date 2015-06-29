class PerfilController < ApplicationController
    
    skip_before_filter :require_cadastro_completo
    
    def index
        @dono = @current_user
    end
    
    def salvar
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
    
end
