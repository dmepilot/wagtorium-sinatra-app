class Owner < ActiveRecord::Base
    has_many :dogs
    has_many :appointments

    has_secure_password
end