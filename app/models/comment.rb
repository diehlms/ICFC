class Comment < ApplicationRecord
    belongs_to :article

    validates :content, presence: true, length: { maximum: 1000 }
end
