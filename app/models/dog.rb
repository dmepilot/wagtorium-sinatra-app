class Dog < ActiveRecord::Base
    belongs_to :owner
    has_many :appointments, through: :owner

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slugx)
        dog=Dog.all
        slugged = Dog.all.find_index do |dog|
            dog.slug == slugx
        end
        dog[slugged]
    end
end