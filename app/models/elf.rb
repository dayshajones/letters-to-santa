class Elf < ApplicationRecord
    has_many :letters
    has_many :users, through: :letters
    accepts_nested_attributes_for :letters

    validates :name, presence: true
end
