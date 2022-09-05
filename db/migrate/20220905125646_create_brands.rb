class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.text :description
      t.string :state
      t.string :identifier, null: false
      t.index :name, unique: true
      t.index :identifier, unique: true
      t.timestamps
    end
  end
end
