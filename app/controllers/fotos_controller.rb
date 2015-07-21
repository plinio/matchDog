class FotosController < ApplicationController
  
  skip_before_filter :require_cadastro_completo
  skip_before_filter :require_dog_selected
  
  def create
    
      path = File.join(Rails.root + "public/images",params[:file].original_filename)
      File.open(path,"wb") do |f|
        f.write(params[:file].read) 
      end
    
      foto = Foto.new
      foto.url = params[:file].original_filename
      foto.descricao = ""
      foto.save
      
      if params[:classe] == 'dog'
        dog = Dog.find(params[:id])
        dog.fotos.append(foto)
        dog.save
      end
      
      if params[:classe] == 'dono'
        dono = Dono.find(params[:id])
        dono.fotos.append(foto)
        dono.save
      end
    
    respond_to do |format|
      format.json{ render :json => foto }
    end
  end

def destroy
  begin
    Foto.find(params[:id]).destroy
  rescue
  end
  respond_to do |format|
      format.json { head :no_content } # 204 No Content
    end
end

def update
  foto = Foto.find(params[:id])

  respond_to do |format|
    if foto.update_attributes(foto_params)
      format.json { head :no_content } # 204 No Content
    else
      format.json { render json: foto.errors, status: :unprocessable_entity }
    end
  end
end

private
  def foto_params
    params.required(:foto).permit(:descricao)
  end

end
