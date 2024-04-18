require "rails_helper"

RSpec.describe Entity::Favourite do
  include Shoulda::Matchers::ActiveModel

  describe 'validations' do
    it { should belong_to(:entity) }
    it { should belong_to(:user) }
  end
end