class CreateLaboratoryItems < ActiveRecord::Migration
  def change
    create_table :laboratory_items do |t|
      t.string :title
      t.text :description
      t.attachment :cover
      t.string :slug

      t.timestamps
    end
    add_index :laboratory_items, :slug, unique: true
  end
end
