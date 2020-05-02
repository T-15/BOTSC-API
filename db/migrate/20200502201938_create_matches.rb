class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references  :home_team
      t.references  :away_team
      t.references  :field,     foreign_key: true
      t.references  :status,    foreign_key: true
      t.integer     :number,    null: false, default: 0
      t.date        :date
      t.time        :time
      t.integer     :home_score
      t.integer     :away_score
      t.string      :additional_information

      t.timestamps
    end
  end
end
