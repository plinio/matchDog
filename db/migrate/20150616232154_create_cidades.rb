class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome, null: false
      t.string :estado, limit: 2, null: false

      t.timestamps null: false
    end
  end
end
