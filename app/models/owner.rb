class Owner < ActiveRecord::Base
    has_many :dogs
    has_many :owner_appointments
end