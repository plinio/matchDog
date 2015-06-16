class CreateRacas < ActiveRecord::Migration
  def change
    create_table :racas do |t|

      t.timestamps null: false
    end
  end
end
