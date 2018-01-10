class CreateEnergies < ActiveRecord::Migration[5.0]
  def change
    create_table :energies do |t|
      t.integer :label
      t.references :house, index: true, foreign_key: true
      t.integer :year
      t.integer :month
      t.decimal :temperature
      t.decimal :daylight
      t.integer :energy_production

      t.timestamps
    end
  end
end
