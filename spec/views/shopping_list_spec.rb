require 'rails_helper'

RSpec.describe 'recipes/shopping_list.html.erb', type: :view do
  before do
    assign(:amount, 5)
    assign(:recipe, Struct.new(:name).new('Pure'))
    assign(:total_price, 100)
    assign(:inventory, Struct.new(:name).new('Inventory'))
    shop_list = [
      { name: 'potato', quantity: 5, measurement_unit: 'kg', shop_price: 20 }
    ]
    assign(:shop_list, shop_list)

    render
  end

  it 'displays the shopping list' do
    expect(rendered).to have_selector('h1', text: 'Shopping List')

    expect(rendered).to have_selector('h3', text: 'Amount of food to buy:')
    expect(rendered).to have_selector('h3', text: 'Recipe: Pure')
    expect(rendered).to have_selector('h3', text: 'Total value of food needed: $100')
    expect(rendered).to have_selector('h3', text: 'Inventory: Inventory')

    expect(rendered).to have_selector('th', text: 'Food')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Price')

    expect(rendered).to have_selector('td', text: 'potato')
    expect(rendered).to have_selector('td', text: '5 kg')
    expect(rendered).to have_selector('td', text: '$20')
  end
end
