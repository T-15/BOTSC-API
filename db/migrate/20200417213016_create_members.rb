class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|

      t.references :status
      t.references :shirt_size
      t.references :short_size
      t.references :referral_method
      t.string :first_name,         null: false, default: ""
      t.string :last_name,          null: false, default: ""
      t.date :birthday,             null: false, default: ""
      t.string :phone,                           default: ""
      t.string :email,                           default: ""
      t.string :postal_code,                     default: ""
      t.string :image,              null: false, default: ""
      t.integer :member_since,      null: false, default: ""
      t.boolean :deceased,          null: false, default: false
      t.date :deceased_date
      t.boolean :masters_eligible,  null: false, default: false
      t.boolean :active,            null: false, default: true

      t.timestamps
    end
  end
end
