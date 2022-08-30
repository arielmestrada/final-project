class Channel < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    scope :group_channels, -> { where(group: true) }
    after_create_commit { broadcast_if_public }
    has_many :messages
    has_many :participants, dependent: :destroy

    def broadcast_if_public
        broadcast_append_to "channels" if self.group
    end

    def self.create_private_channel(users, channel_name)
        single_channel = Channel.create(name: channel_name, group: false)
        users.each do |user|
            Participant.create(user_id: user.id, channel_id: single_channel.id)
        end
        single_channel
    end
end
