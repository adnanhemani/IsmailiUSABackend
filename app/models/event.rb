class Event < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 1, maximum: 50 }
    validates :location, presence: true
    validates :start, presence: true
    validates :end, presence: true
end
