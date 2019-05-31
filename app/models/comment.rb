class Comment < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 1000 }
end
