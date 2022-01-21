class AddRatioToReading < ActiveRecord::Migration[6.1]
  def change
    add_column :readings, :ratio, :float
  end
end
