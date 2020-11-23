class Owner < ActiveRecord::Base
    has_many :dogs
    has_many :appointments

    has_secure_password

    validates :name, :email, :phone, presence: true 

    
    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slugx)
        owner=Owner.all
        slugged = Owner.all.find_index do |owner|
            owner.slug == slugx
        end
        owner[slugged]
    end

end