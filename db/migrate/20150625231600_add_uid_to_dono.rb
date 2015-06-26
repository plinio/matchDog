class AddUidToDono < ActiveRecord::Migration
  def change
    add_column :donos, :uid, :string
  end
end
