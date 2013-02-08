class AddTitleToMediaFile < ActiveRecord::Migration
  def change
    add_column :sevenpages_media_files, :title, :string, limit: 100
  end
end
