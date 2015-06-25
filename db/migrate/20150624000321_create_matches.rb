class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :dog1, class_name: 'Dog', null: false, index: true
      t.belongs_to :dog2, class_name: 'Dog', null: false, index: true
      
      t.datetime :datahora_dog1_viu
      t.datetime :datahora_dog2_viu
      
      t.datetime :datahora_dog1_desistiu
      t.datetime :datahora_dog2_desistiu
      
      t.timestamps null: false
    end
  end
end
