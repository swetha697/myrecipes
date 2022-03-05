require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "swetha", email: "swetha@example.com")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee,add vegetable and oil", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "chicken saute", description: "great chicken dish")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
 
end
