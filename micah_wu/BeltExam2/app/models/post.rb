class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_that_liked, through: :likes, source: :user

  validates :content, presence: true, length: { in: 2..100 }
end
