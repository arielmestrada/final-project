class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  after_create_commit {broadcast_append_to self.channel }
  before_create :confirm_participant

  def confirm_participant
    return if self.channel.group
    is_participant = Participant.where(user_id: self.user.id, channel_id: self.channel.id).first
    throw :abort unless is_participant    
  end
end
