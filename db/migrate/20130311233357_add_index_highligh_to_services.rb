class AddIndexHighlighToServices < ActiveRecord::Migration
  def change
    add_index :services, :highlight
  end
end
