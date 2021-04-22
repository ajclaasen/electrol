class Measurement < ApplicationRecord
  belongs_to :meter

  def start
    meter.start + (nth_measurement_of_parent * meter.interval)
  end

  def finish
    meter.start + ((nth_measurement_of_parent + 1) * meter.interval)
  end

  private
    def nth_measurement_of_parent
      nth_measurement = 0
      meter.measurements.each do |m|
        break if self == m
        nth_measurement += 1
      end
      
      nth_measurement
    end
end
