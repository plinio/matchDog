class AddImageToDono < ActiveRecord::Migration
  def change
    add_column :donos, :image, :string
  end
end
