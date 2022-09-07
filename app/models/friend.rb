class Friend < ApplicationRecord
  belongs_to :user

  def self.user(friend)
    User.find(friend.friend_id)
  end
end
