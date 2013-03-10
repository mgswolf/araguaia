class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.attachment :cover
      t.timestamps
    end
  end
end
