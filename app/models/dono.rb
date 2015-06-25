class Dono < ActiveRecord::Base
    #attr_accessible :nome, :sexo, :email, :foto, :fotos, :dogs
    
    belongs_to :foto
    
    has_many :fotos_donos
    has_many :fotos, :through => :fotos_donos
    
    has_many :dogs
end
