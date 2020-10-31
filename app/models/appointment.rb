class Appointment < ActiveRecord::Base
    belongs_to :owner
    has_one :dog, through: :owner 
end