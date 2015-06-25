class CreateLatidas < ActiveRecord::Migration
  def change
    create_table :latidas do |t|
      t.belongs_to :match, null: false, index: true
      
      t.belongs_to :de_dog, class_name: 'Dog', null: false
      t.belongs_to :para_dog, class_name: 'Dog', null: false
  
      t.text :mensagem, null: false
      
      t.datetime :enviada_em, null: false
      t.datetime :lida_em
      
      t.timestamps null: false
    end
  end
end
