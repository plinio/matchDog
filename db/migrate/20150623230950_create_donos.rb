class CreateDonos < ActiveRecord::Migration
  def change
    create_table :donos do |t|
      t.string :nome, null: false
      t.string :sexo, limit: 1, null: false
      t.string :email, null: false
      t.belongs_to :foto
      
      t.timestamps null: false
    end
    create_table :fotos_donos do |t|
      t.belongs_to :dono, null: false, index: true
      t.belongs_to :foto, null: false
      t.timestamps null: false
    end
  end
end
