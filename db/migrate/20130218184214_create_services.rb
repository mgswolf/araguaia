class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :caption
      t.boolean :highlight, default: false
      t.string :slug

      t.timestamps
    end
    add_index :services, :slug, unique: true
  end
end
