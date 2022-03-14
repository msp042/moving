class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes do |t|
      t.string :name
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
