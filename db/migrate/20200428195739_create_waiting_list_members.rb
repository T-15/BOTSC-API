class CreateWaitingListMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :waiting_list_members do |t|
      t.references :waiting_list, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
