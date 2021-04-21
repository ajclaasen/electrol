class Meter < ApplicationRecord
  validates :name, :start, :finish, :interval, :unit, presence: true
end
