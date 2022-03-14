class AddUserReferenceToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :boxes, :users
    add_index :boxes, :user_id
    change_column_null :boxes, :user_id, false
  end
end
