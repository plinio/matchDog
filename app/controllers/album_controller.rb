class AlbumController < ApplicationController
    layout false

    def dog
    @dog = Dog.find(params[:dog_id])
    
    @fotos = @dog.fotos

    end
    
    def dono
    @dono = Dono.find(params[:dono_id])
    
    @fotos = @dono.fotos

    
    end
    
end
