require 'rails_helper'

RSpec.describe Mine, type: :model do
  let(:object) { create(:mine) }

  it { expect(object).to be_valid }
end
