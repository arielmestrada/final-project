class Post < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  has_many :comments, dependent: :destroy

  after_create_commit { broadcast_append_to "posts" }
  after_update_commit { broadcast_replace_to "posts" }
  after_destroy_commit { broadcast_remove_to "posts" }
end
