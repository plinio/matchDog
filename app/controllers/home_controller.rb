class HomeController < ApplicationController
  def index
    @cidades = Cidade.all.collect {|c| [c.nome,c.id]}
  end


end
