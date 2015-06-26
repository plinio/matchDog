class AddTokenToDono < ActiveRecord::Migration
  def change
    add_column :donos, :token, :string
  end
end
