class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.belongs_to :dono, index: true, null: false
      t.string :nome, null: false
      t.string :sexo, limit: 1, null: false
      t.belongs_to :raca, null: false
      t.belongs_to :cidade, null: false
      t.belongs_to :foto
      
      t.text :descricao_perfil
      t.boolean :tem_pedigree, null: false, default: false
      t.boolean :interessa_cruzar, null: false, default: true
      t.boolean :interessa_passear, null: false, default: true
      
      t.datetime :datahora_excluido
        
      t.timestamps null: false
    end
    create_table :fotos_dogs do |t|
      t.belongs_to :dog, null: false, index: true
      t.belongs_to :foto, null: false
      t.timestamps null: false
    end
  end
end
