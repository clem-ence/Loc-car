class AddColumnToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
    add_column :bookings, :car_id, :bigint
    add_column :bookings, :user_id, :bigint
  end
end
