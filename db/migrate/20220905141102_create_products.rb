class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :department, null: false, foreign_key: true
      t.belongs_to :brand, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      
      t.timestamps
    end
  end
end
