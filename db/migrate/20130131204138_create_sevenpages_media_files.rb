class CreateSevenpagesMediaFiles < ActiveRecord::Migration
  def change
    create_table :sevenpages_media_files do |t|
      t.string :source

      t.timestamps
    end
  end
end
