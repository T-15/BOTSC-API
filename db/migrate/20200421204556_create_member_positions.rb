class CreateMemberPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :member_positions do |t|
      t.references :member, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
