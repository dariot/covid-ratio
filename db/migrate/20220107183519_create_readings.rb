class CreateReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :readings do |t|
      t.datetime :date
      t.integer :new_positives
      t.integer :total_tampons
      t.integer :new_tampons

      t.timestamps
    end
  end
end
