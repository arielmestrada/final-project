class Post < ApplicationRecord
  belongs_to :user
  belongs_to :breed

  after_create_commit { broadcast_append_to "posts" }
end
