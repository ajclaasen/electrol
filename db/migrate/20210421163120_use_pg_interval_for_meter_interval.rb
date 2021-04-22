class UsePgIntervalForMeterInterval < ActiveRecord::Migration[6.1]
  def change
    remove_column :meters, :interval
    add_column :meters, :interval, :interval
  end
end
