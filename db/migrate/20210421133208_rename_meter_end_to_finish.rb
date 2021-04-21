class RenameMeterEndToFinish < ActiveRecord::Migration[6.1]
  def change
    rename_column :meters, :end, :finish
  end
end
