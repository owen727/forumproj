class CreatePostCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :post_category_relationships do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps null: false
    end

    add_index :post_category_relationships, :post_id
    add_index :post_category_relationships, :category_id
  
  end
end
