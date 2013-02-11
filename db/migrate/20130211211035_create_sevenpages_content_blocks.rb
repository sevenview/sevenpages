class CreateSevenpagesContentBlocks < ActiveRecord::Migration
  def change
    create_table :sevenpages_content_blocks do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :sevenpages_content_blocks, :title, unique: true
  end
end
