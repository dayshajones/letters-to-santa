class User < ApplicationRecord
    has_many :letters
    has_many :elves, through: :letters
    
    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :parent_name, presence: true
    validates :kid_name, presence: true

end
