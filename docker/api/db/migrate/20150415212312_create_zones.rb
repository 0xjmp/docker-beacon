class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name, null: false
      t.integer :radius, null: false, default: 100
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps
      t.belongs_to :user
      t.boolean :visible, null: false, default: false
    end
  end
end
