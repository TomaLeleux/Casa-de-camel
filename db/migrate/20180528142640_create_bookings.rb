class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date_start
      t.date :date_end
      t.references :user, foreign_key: true
      t.references :camel, foreign_key: true

      t.timestamps
    end
  end
end
