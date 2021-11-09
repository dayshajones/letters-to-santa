class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :parent_name
      t.string :kid_name

      t.timestamps
    end
  end
end
