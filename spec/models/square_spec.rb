require 'rails_helper'

RSpec.describe Square, type: :model do
  let(:object) { create(:square) }

  it { expect(object).to be_valid }
  it { expect(object.visibility_status).to eq("hidden") }
end
