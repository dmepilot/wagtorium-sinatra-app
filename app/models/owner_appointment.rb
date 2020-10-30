class OwnerAppointment < ActiveRecord::Base
    belongs_to :owner
    belongs_to :appointment
end