class RenameMediaFileToImage < ActiveRecord::Migration
  def up
    remove_index :sevenpages_media_files, :title
    rename_table :sevenpages_media_files, :sevenpages_images
    add_index :sevenpages_images, :title, unique: true
  end

  def down
    rename_table :sevenpages_images, :sevenpages_media_files
    add_index :sevenpages_media_files, :title, unique: true
  end
end
