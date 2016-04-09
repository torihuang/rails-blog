class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggables do |t|
      t.integer  :tag_id
      t.integer  :tagged_id
      t.string   :tagged_type

      t.timestamps(null: false)
    end
  end
end
