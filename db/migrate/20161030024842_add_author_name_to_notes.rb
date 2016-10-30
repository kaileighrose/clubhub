class AddAuthorNameToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :author_name, :string
  end
end
