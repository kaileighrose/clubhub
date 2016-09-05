class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.integer :capacity
      t.integer :price

      t.timestamps null: false
    end
  end
end
