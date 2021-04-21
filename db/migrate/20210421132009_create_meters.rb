class CreateMeters < ActiveRecord::Migration[6.1]
  def change
    create_table :meters do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :interval
      t.string :unit

      t.timestamps
    end
  end
end
