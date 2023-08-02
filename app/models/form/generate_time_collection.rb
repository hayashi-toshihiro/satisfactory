class Form::GenerateTimeCollection < Form::Base
  global = 3
  attr_accessor :recipe_materials

  def initialize(attributes = {})
    super attributes
    self.recipe_materials = global.times.map { RecipeMaterial.new() } unless self.recipe_materials.present?
  end

  def generate_times_attributes=(attributes)
    self.recipe_materials = attributes.map { |_, v| RecipeMaterial.new(v) }
  end

  def save
    RecipeMaterial.transaction do
      self.recipe_materials.map do |recipe_material|
        recipe_material.save
      end
    end
      return true
    rescue => e
      return false
  end
end