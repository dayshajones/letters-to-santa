class User < ApplicationRecord
    has_many :letters
    has_many :elves, through: :letters
    
    has_secure_password
end
