class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist, presence: true, length: {minimum: 2}
    
    has_many :users, through: :playlist, dependent: :destroy
end
