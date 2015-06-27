class AddPasswordToDono < ActiveRecord::Migration
  def change
    add_column :donos, :password, :string
  end
end
