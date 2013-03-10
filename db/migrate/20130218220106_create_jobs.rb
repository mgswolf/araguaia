class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :caption
      t.text :description
      t.string :slug

      t.timestamps
    end

    add_index :jobs, :slug, unique: true
  end
end
