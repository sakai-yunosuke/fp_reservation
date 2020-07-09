class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time, null: false

      t.timestamps
    end
    add_index :schedules, %i(user_id start_time), unique: true
  end
end
