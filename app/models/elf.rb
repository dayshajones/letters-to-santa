class Elf < ApplicationRecord
    has_many :letters
    has_many :users, through: :letters

    validates :name, presence: true
end
