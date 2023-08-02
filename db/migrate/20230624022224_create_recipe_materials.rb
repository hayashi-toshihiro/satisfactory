class CreateRecipeMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_materials do |t|
      t.references :material, foreign_key: { to_table: :items }
      t.references :recipe, null: false
      t.integer :material_time

      t.timestamps
    end
  end
end
