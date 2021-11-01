require 'rails_helper'

RSpec.describe Minefield, type: :model do
  let(:object) { create(:minefield) }

  it { expect(object).to be_valid }
  it { expect(object.uuid).not_to be_nil }
  it { expect(object.status).to eq("created") }
end
