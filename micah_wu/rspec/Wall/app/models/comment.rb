class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates :comment, presence: true, length: {minimum: 10}
  validates :user_id, presence: true
  validates :message_id, presence: true
end
