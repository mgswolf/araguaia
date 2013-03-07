class CreateJobImages < ActiveRecord::Migration
  def change
    create_table :job_images do |t|
      t.references :job

      t.timestamps
    end
    add_index :job_images, :job_id
    add_foreign_key(:job_images, :jobs, dependent: :delete)
  end
end
