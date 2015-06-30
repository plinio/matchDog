class Dog < ActiveRecord::Base
    #attr_accessible :dono, :nome, :sexo, :raca, :cidade, :foto, :fotos, :descricao_perfil, :tem_pedigree, :interessa_cruzar, :interessa_passear
    
    belongs_to :dono
    belongs_to :raca
    belongs_to :cidade
    belongs_to :foto
    
    belongs_to :fotos
    has_many :fotos_dog
    has_many :fotos, :through => :fotos_dogs
    
end

class FotosDog < ActiveRecord::Base
  belongs_to :foto
  belongs_to :dog
end
