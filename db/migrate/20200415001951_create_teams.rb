class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      
      t.references  :convenor
      t.references  :division
      t.references  :sponsor
      t.string      :name,          null: false, default: ""
      t.string      :jersey_image
      t.string      :team_image
      t.integer     :draft_position,            default: "0"
      t.boolean     :active,        null:false, default: true

      t.timestamps
    end
  end
end
