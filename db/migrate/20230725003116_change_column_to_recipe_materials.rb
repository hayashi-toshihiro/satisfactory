class ChangeColumnToRecipeMaterials < ActiveRecord::Migration[6.1]
  def up
    change_column :recipe_materials, :material_time, :float
    change_column :recipe_products, :product_time, :float
  end

  def down
    change_column :recipe_materials, :material_time, :string
    change_column :recipe_products, :product_time, :string
  end
end
