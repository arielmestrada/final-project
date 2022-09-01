class Post < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  has_many :comments

  after_create_commit { broadcast_append_to "posts" }
end
