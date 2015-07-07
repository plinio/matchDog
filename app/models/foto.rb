class Foto < ActiveRecord::Base
    #attr_accessible :url, :descricao
    has_many :dogs, :through => :fotos_dogs, :dependent => :destroy
    has_many :donos, :through => :fotos_donos, :dependent => :destroy
    
    has_many :fotos_dogs
    has_many :fotos_donos
    
end

class FotosDono < ActiveRecord::Base
  belongs_to :foto
  belongs_to :dono
end

class FotosDog < ActiveRecord::Base
  belongs_to :foto
  belongs_to :dog
end