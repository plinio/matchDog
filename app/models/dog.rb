class Dog < ActiveRecord::Base
    #attr_accessible :dono, :nome, :sexo, :raca, :cidade, :foto, :fotos, :descricao_perfil, :tem_pedigree, :interessa_cruzar, :interessa_passear
    
    belongs_to :dono
    belongs_to :raca
    belongs_to :cidade
    belongs_to :foto
    
    has_many :fotos_dogs
    has_many :fotos, :through => :fotos_dogs
    
    def get_count_matches
        m = Match.new;
        m.get_match_count(self.id)
    end
    
    def get_count_latidas
        m = Latida.new;
        m.get_latidas_count(self.id)
    end
    
end

class FotosDog < ActiveRecord::Base
  belongs_to :foto
  belongs_to :dog
end
