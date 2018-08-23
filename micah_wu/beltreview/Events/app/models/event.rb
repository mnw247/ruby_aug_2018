class Event < ActiveRecord::Base
    belongs_to :user
    has_many :join
    has_many :comment
    has_many :joined_users, through: :join,  source: :user

    validates :name, presence: true, length: { in: 2..20 }
    validates :date, presence: true
    validates :city, presence: true, length: {in: 2..15}
    validates :state, presence: true, length: {is: 2}
end
