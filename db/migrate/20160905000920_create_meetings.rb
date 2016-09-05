class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :team_id
      t.integer :space_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
