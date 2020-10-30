class CreateOwnerAppointments < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :owner_id
      t.integer :appointment_id
    end
  end
end
