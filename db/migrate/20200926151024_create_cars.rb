class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :manufacturer
      t.string :plate
      t.integer :model_year
      t.integer :manufacturer_year

      t.timestamps
    end
  end
end
