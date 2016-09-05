class CreateTeamsMembersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :teams, :members
  end
end
