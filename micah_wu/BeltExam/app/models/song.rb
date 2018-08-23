class Song < ActiveRecord::Base
    has_many :playlists
    has_many :subscribed_users, through: :playlists, source: :user

    validates :artist, :title, presence: true, length: { in: 2..50 }
end
