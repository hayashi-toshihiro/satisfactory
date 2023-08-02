class Item < ApplicationRecord

  mount_uploader :item_image, ItemUploader

  has_many :recipe_materials
  has_many :recipe_material_items, through: :recipe_materials, source: :recipe

  has_many :recipe_products
  has_many :recipe_product_items, through: :recipe_products, source: :recipe

end
