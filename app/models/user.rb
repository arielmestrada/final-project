class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  scope :all_except, -> (user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

  has_many :messages
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
end
