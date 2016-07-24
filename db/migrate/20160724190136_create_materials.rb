class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.integer :episode
      t.integer :year
      t.time :som
      t.time :eom
      t.string :aspect_ratio
      t.string :material_type
      t.string :delivery_channel_group
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
