class AddTeamInfoToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :team_info, :text
  end
end
