class AddScheduleGeneratedToSeason < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :schedule_generated, :boolean, default: false
  end
end
