class AddProviderToDono < ActiveRecord::Migration
  def change
    add_column :donos, :provider, :string
  end
end
