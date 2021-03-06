class User < ActiveRecord::Base
    has_secure_password
    has_many :playlists
    has_many :subscribed_songs, through: :playlists, source: :song
      
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    before_save { |user| user.email = user.email.downcase }
end
