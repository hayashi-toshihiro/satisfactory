class CreateRecipeProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_products do |t|
      t.references :product, foreign_key: { to_table: :items }
      t.references :recipe, null: false
      t.integer :product_time

      t.timestamps
    end
  end
end
