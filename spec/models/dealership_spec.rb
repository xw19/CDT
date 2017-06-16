require 'rails_helper'

RSpec.describe Dealership, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:admin_id) }
end
