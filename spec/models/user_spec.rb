require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Has inventories' do
    association = described_class.reflect_on_association(:inventories)
    expect(association.macro).to eq :has_many
  end

  it 'Has recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq :has_many
  end
end
