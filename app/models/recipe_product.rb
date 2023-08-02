class RecipeProduct < ApplicationRecord
  belongs_to :product, class_name: "Item"
  belongs_to :recipe
end
