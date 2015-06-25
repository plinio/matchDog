class CreateCurtidas < ActiveRecord::Migration
  def change
    create_table :curtidas do |t|
      t.belongs_to :dog, null: false, index: true
      t.belongs_to :dog_alvo, class_name: 'Dog', null: false
      t.boolean :curtiu, null: false
      t.belongs_to :match 
      t.timestamps null: false
    end
  end
end
