class Announcement < ActiveRecord::Base
    belongs_to :jamatkhana

    validates :title, presence: true, length: { minimum: 1, maximum: 50 }
    validates :body, presence: true


end
