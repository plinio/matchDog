class CreateRacas < ActiveRecord::Migration
  def change
    create_table :racas do |t|
      t.primary_key :id
      t.string :nome

      t.timestamps null: false
    end
  end
end
