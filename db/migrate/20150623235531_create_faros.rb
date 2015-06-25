class CreateFaros < ActiveRecord::Migration
  def change
    create_table :faros do |t|
      t.belongs_to :dog, index: true, null: false
      
      t.string :sexo_dono, limit: 1
      t.string :sexo_dog, limit: 1
      t.belongs_to :raca
      
      t.belongs_to :cidade
      
      t.boolean :interessa_tem_pedigree
      t.boolean :interessa_cruzar
      t.boolean :interessa_passear
      
      t.timestamps null: false
    end
  end
end
