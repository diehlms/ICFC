class Cabindate < ApplicationRecord 
    belongs_to :cabin
    validates :startdate, presence: true
    validates :enddate, presence: true
end