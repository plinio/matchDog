class MatchesController < ApplicationController
  def index
    @matches = Match.where(dog1: @current_dog).order("created_at DESC")
    @matches.each do |m|
      m.datahora_dog1_viu = Time.now
      m.save
    end
  end


end
