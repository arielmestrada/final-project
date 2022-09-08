class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_commit { broadcast_update_to('posts', target: "comment-#{post.id}-count", partial: "comments/comment_count", locals: { comment_c: post.comments.count, post_i: post.id }) }
  after_create_commit { broadcast_append_to "posts", target:"post_#{post.id}_comments" }
  after_update_commit { broadcast_replace_to "posts", target:"post_#{post.id}_comment_#{self.id}" }
  after_destroy_commit { broadcast_remove_to "posts", target:"post_#{post.id}_comment_#{self.id}" }

end
