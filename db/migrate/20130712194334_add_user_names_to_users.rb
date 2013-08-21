class AddUserNamesToUsers < ActiveRecord::Migration
  def change
    # We want to add a username column to users
    add_column :users, :username, :string
  end
end
