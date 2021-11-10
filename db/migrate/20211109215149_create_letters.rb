class CreateLetters < ActiveRecord::Migration[6.1]
  def change
    create_table :letters do |t|
      t.integer :user_id
      t.integer :elf_id
      t.text :content
      t.timestamps
    end
  end
end
