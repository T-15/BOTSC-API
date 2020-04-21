class CreateConstitutionByLaws < ActiveRecord::Migration[5.1]
  def change
    create_table :constitution_by_laws do |t|
      
      t.integer :position
      t.string  :title,     null: false, default: ""
      t.string  :content,   null: false, default: ""
      t.boolean :active,    null: false, default: true

      t.timestamps
    end
  end
end
