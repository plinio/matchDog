class LoginController < ApplicationController
  layout "initial"

  skip_before_filter :require_login

  def index
    @var = session[:user_id]
  end
  def new
    
  end


end
