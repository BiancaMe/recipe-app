require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
Recipe.create(name: 'Pizza', preparation_time: 0.5, cooking_time: 30, description: 'Pizza', public: true,
              user: first_user)
