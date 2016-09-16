class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :author_id
      t.text :content
      t.integer :meeting_id
      t.timestamps null: false
    end
  end
end
