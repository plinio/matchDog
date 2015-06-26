class AddExpiresAtToDono < ActiveRecord::Migration
  def change
    add_column :donos, :expires_at, :string
  end
end
