class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      
      t.string :name,     null: false, default: ""
      t.boolean :active,  null: false, default: true

      t.timestamps
    end
  end
end
