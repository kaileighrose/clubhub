class AddTeamNameColumnToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :team_name, :string
  end
end
