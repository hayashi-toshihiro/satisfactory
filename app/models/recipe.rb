class Recipe < ApplicationRecord
  has_many :recipe_materials
  has_many :materials, through: :recipe_materials

  has_many :recipe_products
  has_many :products, through: :recipe_products

  belongs_to :machine

  accepts_nested_attributes_for :recipe_materials
  accepts_nested_attributes_for :recipe_products
end
