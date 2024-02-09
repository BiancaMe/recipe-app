require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'recipes/public_recipes.html.erb', type: :view do
  include Devise::Test::ControllerHelpers
  before do
    recipes = [
      FactoryBot.build_stubbed(:recipe, name: 'Pure', description: 'Description 1', public: true),
      FactoryBot.build_stubbed(:recipe, name: 'Soap', description: 'Description 2', public: true)
    ]
    assign(:recipes, recipes)
    render
  end

  it 'display' do
    expect(rendered).to have_selector('h1', text: 'Public Recipes')
    expect(rendered).to have_selector('h2', text: 'Pure')
    expect(rendered).to have_selector('h2', text: 'Soap')

    expect(rendered).to have_selector('h3', text: 'John Doe')

    expect(rendered).to have_selector('div', text: 'Total food items: 0')
    expect(rendered).to have_selector('div', text: 'Total price $ 0')
  end
end
