class Cabin < ApplicationRecord
    validates :name, presence: true
    validates :bedrooms, presence: true
    has_many :cabindates
    belongs_to :user

    mount_uploader :images, ImageUploader
end
