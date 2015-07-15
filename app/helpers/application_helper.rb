module ApplicationHelper
    
 
def current_user
    @current_user
end

def current_dog
    @current_dog
end

def current_faro
   @current_faro
end

def get_racas
    Raca.all.collect {|c| [c.nome,c.id]} 
end

def get_cidades
   Cidade.all.collect {|c| [c.nome + ' - ' + c.estado,c.id]} 
end

def contador_matches
    @current_dog.get_count_matches
end

def contador_latidas
    @current_dog.get_count_latidas
end

end
