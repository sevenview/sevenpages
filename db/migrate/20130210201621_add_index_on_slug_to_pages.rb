class AddIndexOnSlugToPages < ActiveRecord::Migration
  def change
    add_index :sevenpages_pages, :slug, unique: true
  end
end
