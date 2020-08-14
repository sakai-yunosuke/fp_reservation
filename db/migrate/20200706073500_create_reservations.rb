class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :schedule, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
