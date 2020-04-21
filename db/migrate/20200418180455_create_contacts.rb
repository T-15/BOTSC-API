class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|

      t.references :member
      t.string :name,   null: false, default: ""
      t.string :phone,  null:false, default: ""

      t.timestamps
    end
  end
end
