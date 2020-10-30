class Appointment < ActiveRecord::Base
    has_many :owner_appointments
    has_many :dogs, through: :owner_appointments
end