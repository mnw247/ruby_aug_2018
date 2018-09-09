class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :name, presence: true, length: { in: 2..20 }
    before_save { |user| user.email = user.email.downcase }
    validates :message, length: { minimum: 2 }
    validates :phone, length: { is: 10 }
end