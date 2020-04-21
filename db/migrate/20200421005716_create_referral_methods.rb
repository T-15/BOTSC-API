class CreateReferralMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :referral_methods do |t|
      
      t.string :name, null: false, default: true

      t.timestamps
    end
  end
end
