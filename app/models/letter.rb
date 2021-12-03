class Letter < ApplicationRecord
    belongs_to :user
    belongs_to :elf

    validates :content, presence: true, length: {minimum:3, maximum:100}
   
    def elf_attributes=(hash_of_attributes)
        if !hash_of_attributes[:name].blank?
            self.elf = Elf.find_or_create_by(hash_of_attributes)
        end
    end
    
end
