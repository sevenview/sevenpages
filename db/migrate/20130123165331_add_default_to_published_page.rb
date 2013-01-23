class AddDefaultToPublishedPage < ActiveRecord::Migration
  def self.up
    change_column_default :sevenpages_pages, :published, false
  end

  def self.down
    change_column_default :sevenpages_pages, :published, nil
  end
end
