class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :title
      t.text :description
      t.attachment :cover
      t.string :slug

      t.timestamps
    end
    add_index :equipment, :slug, unique: true
  end
end
