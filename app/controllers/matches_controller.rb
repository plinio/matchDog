class MatchesController < ApplicationController
  def index
    @matches = Match.where("dog1_id = #{@current_dog.id} OR dog2_id = #{@current_dog.id}").where.not("(datahora_dog1_desistiu IS NOT NULL OR datahora_dog2_desistiu IS NOT NULL)").order("created_at DESC")
    @matches.each do |m|
      case @current_dog.id
      when m.dog1.id
        m.datahora_dog1_viu = Time.zone.now
      when m.dog2.id
        m.datahora_dog2_viu = Time.zone.now
      end
      m.save
    end
    
  end
  
  def naorolamais
      m = Match.find(params[:match_id])
      case @current_dog.id
      when m.dog1.id
        m.datahora_dog1_desistiu = Time.zone.now
      when m.dog2.id
        m.datahora_dog2_desistiu = Time.zone.now
      end
      m.save
  redirect_to "/matches"
  end

end
