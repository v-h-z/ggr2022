class Boat < ApplicationRecord
  belongs_to :race
  has_many :positions
end
