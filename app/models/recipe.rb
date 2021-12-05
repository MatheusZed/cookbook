class Recipe
  attr_reader :name, :recipe_type

  def initialize(name:, recipe_type:)
    @name = name
    @recipe_type = recipe_type     
  end
end
