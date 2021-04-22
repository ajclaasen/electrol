class Meter < ApplicationRecord
  has_many :measurements, dependent: :destroy

  # Ensures interval returns an `ActiveSupport::Duration` object.
  # Default behavior (thus, an obsolete line of code) from Rails 6.2 onwards.
  attribute :interval, :interval

  validates :name, :start, :finish, :interval, :unit, presence: true

  def self.interval_options
    {
      "Days": 1.day,
      "Weeks": 1.week,
      "Months": 1.month,
      "Years": 1.year
    }
  end
end
