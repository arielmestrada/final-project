class Post < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  has_many :comments, dependent: :destroy

  after_create_commit do
    broadcast_prepend_to "posts" 
    # broadcast_update_to("posts", target: "comment-form-id", partial: "comments/new_comment_form", locals: { saved_id: cookies[:uid] })
  end
  after_update_commit { broadcast_replace_to "posts" }
  after_destroy_commit { broadcast_remove_to "posts" }
end
