class CreateTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.references :member
      t.references :team

      t.timestamps
    end
  end
end
