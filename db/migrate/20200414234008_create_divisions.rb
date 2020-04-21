class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      
      t.string      :name,    null: false, default: ""
      t.references  :season,  null: false,                foreign_key: true
      t.boolean     :active,  null: false, default: true

      t.timestamps
    end
  end
end
