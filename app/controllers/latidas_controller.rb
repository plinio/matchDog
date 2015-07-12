class LatidasController < ApplicationController
    layout false #tirar isso caso queira layout completo
    
    def domatch
        @match = Match.find(params[:match_id])
        @latidas = Latida.where(match_id: params[:match_id]).order("created_at")
    end
    
    def enviar
       @match = Match.find(params[:match_id])    
       latida = Latida.new
       latida.match = @match
       latida.de_dog = @current_dog
       latida.para_dog = (@current_dog == @match.dog1) ? @match.dog2 : @match.dog1
       latida.enviada_em = Time.zone.now
       latida.mensagem = params[:mensagem]
       latida.save
       
       render json: { 'result' => 1 }
    end
    
    def euvi
        time = Time.zone.now
        Latida.where("lida_em is null AND para_dog_id = #{@current_dog.id} AND match_id = #{params[:match_id]}").update_all({:lida_em => time})
        render json: { 'result' => 1 }
    end
    
end
