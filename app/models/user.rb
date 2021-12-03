class User < ApplicationRecord
    has_many :letters
    has_many :elves, through: :letters
    
    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.parent_name = auth['info']['first_name']
            u.kid_name = auth['info']['last_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
end
