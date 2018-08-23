class User < ActiveRecord::Base
  has_secure_password
  has_many :event
  has_many :comment, dependent: :destroy
  has_many :joined_events, through: :join, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :city, presence: true, length: {in: 2..15}
  validates :state, presence: true, length: {is: 2}
  # validates :password, confirmation: true, length: {minimum:8}
  # validates :password_confirmation, presence: true, length: {minimum:8}
  before_save { |user| user.email = user.email.downcase }
end
