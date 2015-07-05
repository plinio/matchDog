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

end
