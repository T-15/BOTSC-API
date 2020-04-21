class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      
      t.integer :year,    null: false, default: "0000"
      t.string  :name,    null: false, default: ""
      t.boolean :active,  null: false, default: true

      t.timestamps
    end
  end
end
