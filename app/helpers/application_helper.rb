module ApplicationHelper
    
 
def current_user
    @current_user
end

def current_dog
    @current_dog
end

def get_racas
    Raca.all.collect {|c| [c.nome,c.id]} 
end

def get_cidades
   Cidade.all.collect {|c| [c.nome + ' - ' + c.estado,c.id]} 
end

def contador_matches
    m = Match.new;
    m.get_match_count(@current_user.dogs)
end

def contador_latidas
    m = Latida.new;
    m.get_latidas_count(@current_user.dogs)
end

def current_faro
   @current_faro = Faro.where("dog_id = #{@current_dog.id}").order("created_at DESC").first || create_initial_faro_to_current_dog()
end


end
