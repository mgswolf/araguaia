class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.date :report_date
      t.text :description
      t.references :user
      t.string :slug

      t.timestamps
    end
    add_index :reports, :user_id
    add_index :reports, :slug, unique: true
    add_foreign_key(:reports, :users, dependent: :delete)
  end
end
