class FotosController < ApplicationController
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
    
    if foto.save!
      respond_to do |format|
        format.json{ render :json => foto }
      end
    end
  end

def destroy
  Foto.find(params[:id]).destroy
  
  respond_to do |format|
      format.html { redirect_to :back, notice: 'Foto foi removida.' }
      format.json { head :no_content } # 204 No Content
    end
end

def update
  foto = Foto.find(params[:id])

  respond_to do |format|
    if foto.update_attributes(foto_params)
      format.html { redirect_to foto, notice: 'Foto foi atualizada.' }
      format.json { head :no_content } # 204 No Content
    else
      format.html { render action: "edit" }
      format.json { render json: foto.errors, status: :unprocessable_entity }
    end
  end
end

private
  def foto_params
    params.required(:foto).permit(:descricao)
  end

end
