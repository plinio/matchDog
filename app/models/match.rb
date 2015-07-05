class Match < ActiveRecord::Base
    #attr_accessor :dog1, :dog2, :datahora_dog1_viu, :datahora_dog2_viu, :datahora_dog1_desistiu, :datahora_dog2_desistiu
    
    belongs_to :dog1, :class_name => "Dog"
    belongs_to :dog2, :class_name => "Dog"
    
    has_many :curtidas
    has_many :latidas
    
    
    def get_match_count(cachorros)
        aux = []
        cachorros.each do |d|
           aux.push(d.id)
        end
        cachorros = aux.join(",")
        Match.where("(dog1_id IN (#{cachorros}) AND datahora_dog1_viu IS NULL) OR (dog2_id IN (#{cachorros}) AND datahora_dog2_viu IS NULL)").count
    end
    
end
