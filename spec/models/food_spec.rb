require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @food = Food.new(name: 'potato', measurement_unit: 'g', price: 2)
    @food.save
  end

  it 'Has inventory foods' do
    association = Food.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq(:has_many)
  end

  it 'Has recipe foods' do
    association = Food.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq(:has_many)
  end
end
