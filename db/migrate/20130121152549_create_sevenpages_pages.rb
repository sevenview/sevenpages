class CreateSevenpagesPages < ActiveRecord::Migration
  def change
    create_table :sevenpages_pages do |t|
      t.string :title
      t.string :slug, limit: 100
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
