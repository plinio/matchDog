class Latida < ActiveRecord::Base
    #attr_accessible :match, :de_dog, :para_dog, :mensagem, :enviada_em, :lida_em
    
    belongs_to :match
    belongs_to :de_dog, :class_name => "Dog"
    belongs_to :para_dog, :class_name => "Dog"
    
    def get_latidas_count(cachorro)
        Latida.where("(para_dog_id = #{cachorro} AND lida_em IS NULL)").count
    end
    
end
