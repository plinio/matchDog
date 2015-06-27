class DogsController < ApplicationController
  
  skip_before_filter :require_cadastro_completo
  
  def new
    
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @dogs = @current_user.dogs
  end

  def show
  end
end
