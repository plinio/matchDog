class Dono < ActiveRecord::Base
    #attr_accessible :nome, :sexo, :email, :foto, :fotos, :dogs
    
    belongs_to :foto
    
    has_many :fotos_donos
    has_many :fotos, :through => :fotos_donos
    
    has_many :dogs
    
    def self.omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |dono|
            dono.provider = auth.provider 
            dono.uid      = auth.uid
            dono.nome     = auth.info.name
            dono.sexo     = 'I'
            dono.email    = auth.info.email
            dono.image    = auth.info.image
            dono.save
        end
    end
    
end

class FotosDono < ActiveRecord::Base
  belongs_to :foto
  belongs_to :dono
end
