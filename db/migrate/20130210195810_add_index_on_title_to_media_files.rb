class AddIndexOnTitleToMediaFiles < ActiveRecord::Migration
  def change
    add_index :sevenpages_media_files, :title, unique: true
  end
end
