class CreateMemberServices < ActiveRecord::Migration[5.1]
  def change
    create_table :member_services do |t|

      t.string    :name,          null: false,  default: ""
      t.string    :contact_name,  null: false,  default: ""
      t.string    :description,                 default: ""
      t.string    :image,                       default: ""
      t.string    :website_url,                 default: ""
      t.string    :facebook_url,                default: ""
      t.string    :twitter_url,                 default: ""
      t.string    :instagram_url,               default: ""
      t.string    :email,                       default: ""
      t.string    :phone,                       default: ""
      t.boolean   :active,        null: false,  default: true
      
      t.timestamps
    end
  end
end
