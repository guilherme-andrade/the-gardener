class CreateGardenerPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :gardener_plants do |t|
      t.references :gardener, foreign_key: true
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
