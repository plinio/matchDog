class LoginController < ApplicationController
  layout "initial"

  skip_before_filter :require_login
  skip_before_filter :require_cadastro_completo

  def index
    
  end
  def new
    
  end


end
