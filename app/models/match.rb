class Match < ActiveRecord::Base
    #attr_accessible :dog1, :dog2, :datahora_dog1_viu, :datahora_dog2_viu, :datahora_dog1_desistiu, :datahora_dog2_desistiu
    
    belongs_to :dog1
    belongs_to :dog2
    
    has_many :curtidas
    has_many :latidas
end
