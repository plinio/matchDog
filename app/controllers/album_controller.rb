class AlbumController < ApplicationController
    
    def dog
    @dog = Dog.find(params[:dog_id])
    
    @fotos = @dog.fotos

    #if request.xhr?
        render :json => {
                            :file_content => @fotos
                        }
     end
    #end
    
    def dono
    @dono = Dono.find(params[:dono_id])
    
    @fotos = @dono.fotos

    #if request.xhr?
        render :json => {
                            :file_content => @fotos
                        }
     #end
    end
    
end
