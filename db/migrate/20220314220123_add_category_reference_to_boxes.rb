class AddCategoryReferenceToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :boxes, :categories
    add_index :boxes, :category_id
    change_column_null :boxes, :category_id, false
  end
end
