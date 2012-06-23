class CreateLocationCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :title
    end
    add_column :locations, :category_id, :integer
  end

  def down
    drop_table :categories
    remove_column :locations, :category_id
  end
end
