class CreateRacas < ActiveRecord::Migration
  def change
    create_table :racas do |t|
      t.string :nome, null: false

      t.timestamps null: false
    end
  end
end
