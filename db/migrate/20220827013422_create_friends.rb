class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :nickname
      t.boolean :is_approver
      t.boolean :is_friends
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
