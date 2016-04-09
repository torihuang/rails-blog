class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggables do |t|
      t.integer  :tag_id
      t.integer  :blog_id

      t.timestamps(null: false)
    end
  end
end
