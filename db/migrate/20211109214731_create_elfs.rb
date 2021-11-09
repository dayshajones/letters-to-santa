class CreateElfs < ActiveRecord::Migration[6.1]
  def change
    create_table :elfs do |t|
      t.string :name

      t.timestamps
    end
  end
end
