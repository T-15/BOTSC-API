class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|

      t.string  :name,            null: false, default: ""
      t.string  :google_maps_url, null: false, default: ""
      t.boolean :active,          null: false, default: true

      t.timestamps
    end
  end
end
