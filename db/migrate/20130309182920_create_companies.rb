class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title, null: false
      t.text :description
      t.attachment :cover
      t.timestamps
    end
  end
end
