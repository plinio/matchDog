class PerfilController < ApplicationController
    
    skip_before_filter :require_cadastro_completo
    
    def index
    
    end
    
end
