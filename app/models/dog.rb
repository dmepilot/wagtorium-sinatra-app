class Dog < ActiveRecord::Base
    belongs_to :owner
    has_many :appointments, through: :owner
end