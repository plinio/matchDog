class Faro < ActiveRecord::Base
    #attr_accessible :dog, :sexo_dono, :sexo_dog, :raca, :interessa_cruzar, :interessa_passear, :interessa_tem_pedigree
    
    belongs_to :dog
    
    belongs_to :cidade
    
    belongs_to :raca
end
