class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|

      t.string  :image,                    default: ""
      t.string  :website_url,              default: ""
      t.boolean :active,      null: false, default: true

      t.timestamps
    end
  end
end
