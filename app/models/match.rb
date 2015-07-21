class Match < ActiveRecord::Base
    #attr_accessor :dog1, :dog2, :datahora_dog1_viu, :datahora_dog2_viu, :datahora_dog1_desistiu, :datahora_dog2_desistiu
    
    belongs_to :dog1, :class_name => "Dog"
    belongs_to :dog2, :class_name => "Dog"
    
    has_many :curtidas
    has_many :latidas
    
    
    def get_match_count(cachorro)
        Match.where("dog1_id = #{cachorro}  OR dog2_id = #{cachorro}").where.not("(datahora_dog1_desistiu IS NOT NULL OR datahora_dog2_desistiu IS NOT NULL)").count
    end
    
end
