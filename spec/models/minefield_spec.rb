require 'rails_helper'

RSpec.describe Minefield, type: :model do
  let(:object) { create(:minefield) }

  it { expect(object).to be_valid }
end
