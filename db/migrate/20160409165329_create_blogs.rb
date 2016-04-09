class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :author_id
      t.string  :title
      t.string  :description

      t.timestamps(null: false)
    end
  end
end
