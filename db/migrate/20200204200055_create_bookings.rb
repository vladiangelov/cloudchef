class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time
      t.integer :servings

      t.timestamps
    end
  end
end
