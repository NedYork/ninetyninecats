class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :name, null: false
      t.string :sex, null: false, limit: 1
      t.string :color
      t.text :description
      
      t.timestamps null: false
    end
  end
end
