class CreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :permission_level, null: false
      t.datetime :last_logged_in

      t.timestamps
    end
    add_index :admins, :username, unique: true
    add_index :admins, :email, unique: true
  end
end
