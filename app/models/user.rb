class User < ApplicationRecord
  before_create :set_url
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }

  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true

  has_many :friends
  has_many :posts

  def set_url
    unless User.all.empty?
      self.image_url = "https://xsgames.co/randomusers/assets/avatars/#{sex}/#{User.last.id + 1}.jpg"
    end
  end
end
