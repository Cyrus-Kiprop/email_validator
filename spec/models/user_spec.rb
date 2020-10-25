require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:email) }

  it do
    should validate_length_of(:email).is_at_most(255)
  end

  subject { FactoryBot.create(:user) }

  it do
    should validate_uniqueness_of(:email).ignoring_case_sensitivity
  end
end
