class RemoveImageToDono < ActiveRecord::Migration
  def change
    remove_column :donos, :image
  end
end
