class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :active
      t.datetime :next_meeting
      t.integer :coach_id

      t.timestamps null: false
    end
  end
end
