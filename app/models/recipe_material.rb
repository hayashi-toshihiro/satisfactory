class RecipeMaterial < ApplicationRecord
  belongs_to :material, class_name: "Item"
  belongs_to :recipe
end
