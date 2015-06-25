class Curtida < ActiveRecord::Base
    #attr_accessible :dog, :dog_alvo, :curtiu, :match
    
    belongs_to :dog
    belongs_to :dog_alvo
    
    belongs_to :match
end
