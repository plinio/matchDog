class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :url, null: false
      t.text :descricao

      t.timestamps null: false
    end
  end
end
