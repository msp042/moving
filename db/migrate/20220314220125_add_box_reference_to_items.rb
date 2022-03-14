class AddBoxReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :boxes
    add_index :items, :box_id
    change_column_null :items, :box_id, false
  end
end
