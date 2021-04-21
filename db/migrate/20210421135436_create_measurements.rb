class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.belongs_to :meter, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
