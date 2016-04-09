class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|
      t.integer :heartable_id
      t.string  :heartable_type

      t.timestamps(null: false)
    end
  end
end
