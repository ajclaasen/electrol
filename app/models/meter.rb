class Meter < ApplicationRecord
  has_many :measurements, dependent: :destroy

  validates :name, :start, :finish, :interval, :unit, presence: true
end
