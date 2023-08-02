class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :recipe_name, null: false
      t.belongs_to :machine, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
