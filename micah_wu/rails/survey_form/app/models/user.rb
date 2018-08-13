class User < ActiveRecord::Base
    validates :name, :location, :language, presence: :true
end
