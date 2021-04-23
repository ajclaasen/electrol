class AddApprovedToMeasurements < ActiveRecord::Migration[6.1]
  def change
    add_column :measurements, :approved, :boolean, default: false
  end
end
