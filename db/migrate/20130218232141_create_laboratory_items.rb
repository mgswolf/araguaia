class CreateLaboratoryItems < ActiveRecord::Migration
  def change
    create_table :laboratory_items do |t|
      t.string :title

      t.timestamps
    end
  end
end
