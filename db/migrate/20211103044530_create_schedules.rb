class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_day
      t.date :end_day
      t.datetime :update_at
      t.string :memo
      t.boolean :all_day
      t.string :alert_success
      t.string :aleart_delete

      t.timestamps
    end
  end
end
