# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid' do
    let(:merchant) { create(:merchant) }
    let(:shopper) { create(:shopper) }

    context 'when order is valid' do
      subject { build_stubbed(:order, merchant: merchant, shopper: shopper) }
      it 'is valid' do
        expect(subject).to be_valid
      end
    end
  end

  describe '#invalid' do
    let(:merchant) { create(:merchant) }
    let(:shopper) { create(:shopper) }

    context 'invalid order when amount=nil' do
      subject { build_stubbed(:order, amount: nil, merchant: merchant, shopper: shopper) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid order when completed_at=nil' do
      subject { build_stubbed(:order, completed_at: nil, merchant: merchant, shopper: shopper) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid order when merchant=nil' do
      subject { build_stubbed(:order, merchant: nil, shopper: shopper) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid order when shopper=nil' do
      subject { build_stubbed(:order, merchant: merchant, shopper: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end
  end
end
