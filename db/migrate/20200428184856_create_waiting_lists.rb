class CreateWaitingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :waiting_lists do |t|
      t.string :name
      t.references :division, foreign_key: true

      t.timestamps
    end
  end
end
