class CreateOwnerAppointments < ActiveRecord::Migration
  def change
    create_table :owner_appointments do |t|
      t.integer :owner_id
      t.integer :appointment_id
    end
  end
end
