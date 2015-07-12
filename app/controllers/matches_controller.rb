class MatchesController < ApplicationController
  def index
    @matches = Match.where(dog1: @current_dog).where("datahora_dog1_desistiu IS NOT NULL OR datahora_dog2_desistiu IS NOT NULL").order("created_at DESC")
    @matches.each do |m|
      m.datahora_dog1_viu = Time.now
      m.save
    end
    
  end
  
  def naorolamais
      match= Match.find(params[:match_id])
      time = Time.zone.now
      case @current_dog.id
      when match.dog1.id
        match.datahora_dog1_desistiu = time
      when match.dog2.id
        match.datahora_dog2_desistiu = time
      end
      match.save
  redirect_to "/matches"
  end

end
