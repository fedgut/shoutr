class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, unique: true
    add_index :users, :username
  end
end
