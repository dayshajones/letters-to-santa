class Letter < ApplicationRecord
    belongs_to :user
    belongs_to :elf
   
    def elf_attributes=(hash_of_attributes)
        if !hash_of_attributes[:name].blank?
            self.elf = Elf.find_or_create_by(hash_of_attributes)
        end
    end
    
end
