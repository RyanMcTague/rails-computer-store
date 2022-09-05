class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :department_type, null: false
      t.text :description
      t.index :name, unique: true
      t.timestamps
    end
  end
end
