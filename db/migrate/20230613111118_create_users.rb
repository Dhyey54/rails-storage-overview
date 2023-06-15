class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :firstname
      t.string :lastname
      t.bigint :phonenumber
      t.string :password_digest

      t.timestamps
    end
  end
end
