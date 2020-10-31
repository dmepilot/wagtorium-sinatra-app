class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date_time
      t.integer :owner_id
    end
  end
end
