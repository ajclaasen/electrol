class Meter < ApplicationRecord
  has_many :measurements, dependent: :destroy
  accepts_nested_attributes_for :measurements, reject_if: proc { |atts| atts['id'].blank? }

  # Ensures interval returns an `ActiveSupport::Duration` object.
  # Default behavior (thus, an obsolete line of code) from Rails 6.2 onwards.
  attribute :interval, :interval

  validates :name, :start, :finish, :interval, :unit, presence: true
  validate :finish_is_after_start

  before_create :instantiate_measurements

  def self.interval_options
    {
      "Days": 1.day,
      "Weeks": 1.week,
      "Months": 1.month,
      "Years": 1.year
    }
  end

  private

    def instantiate_measurements
      return unless interval > 0

      duration_in_days = finish - start
      amount_of_measurements = (duration_in_days / interval.in_days).ceil

      amount_of_measurements.times do
        measurements.build()
      end
    end

    def finish_is_after_start
      if finish <= start
        errors.add(:finish, "needs to be after start")
      end
    end
end
