class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :event

    validates :content, presence: true, length: {minimum:6}
end
