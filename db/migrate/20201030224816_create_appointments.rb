class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date_time
      t.integer :owner_id
      t.integer :dog_id
    end
  end
end
