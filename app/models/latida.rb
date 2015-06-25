class Latida < ActiveRecord::Base
    #attr_accessible :match, :de_dog, :para_dog, :mensagem, :enviada_em, :lida_em
    
    belongs_to :match
    belongs_to :de_dog
    belongs_to :para_dog
end
