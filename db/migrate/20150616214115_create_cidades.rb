class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.primary_key :id
      t.string :nome
      t.string :estado

      t.timestamps null: false
    end
  end
end
