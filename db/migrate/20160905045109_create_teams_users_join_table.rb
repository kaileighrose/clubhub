class CreateTeamsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :teams, :users
  end
end
