class Dono < ActiveRecord::Base
    #attr_accessible :nome, :sexo, :email, :foto, :fotos, :dogs
    
    belongs_to :foto
    
    has_many :fotos_donos
    has_many :fotos, :through => :fotos_donos
    
    has_many :dogs, -> { where "datahora_excluido is null" }
    
    def self.omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |dono|
            dono.provider = auth.provider 
            dono.uid      = auth.uid
            dono.nome     = auth.info.name
            dono.sexo     = auth.extra.raw_info.gender === 'male' ? 'M' :  auth.extra.raw_info.gender === 'female' ? 'F' : 'I'
            dono.email    = auth.info.email
            dono.image    = auth.info.image
            

            #salva a imagem do face no diretorio do servidor
            #partial_path = 'face_image_'+auth.uid+'.png'
            #path = File.join(Rails.root + "public/images",partial_path)
            #File.open(path, 'wb') do |fi|
            #    fi.write open(auth.info.image).read 
            #end
            
            #salva a foto e adiciona como foto do perfil
            #foto = Foto.new
            #foto.url = partial_path
            #foto.descricao = "Foto do Perfil"
            #foto.save
            #dono.foto = foto


            dono.save
        end
        
    end
    
end

class FotosDono < ActiveRecord::Base
  belongs_to :foto
  belongs_to :dono
end
