class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      
      t.references :member, foreign_key: true
      t.string :content, null: false, default: ""

      t.timestamps
    end
  end
end
