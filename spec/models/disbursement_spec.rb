# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe '#valid' do
    let(:merchant) { create(:merchant) }
    let(:shopper) { create(:shopper) }
    let(:order) { create(:order, merchant: merchant, shopper: shopper) }

    context 'when disbursement is valid' do
      subject { build_stubbed(:disbursement, merchant: merchant, order: order) }
      it 'is valid' do
        expect(subject).to be_valid
        fee = format('%0.2f', (subject.actual_price.to_f - subject.disbursed_price.to_f))
        expect(subject.fee).to eq fee.to_f
      end
    end
  end

  describe '#invalid' do
    let(:merchant) { create(:merchant) }
    let(:shopper) { create(:shopper) }
    let(:order) { create(:order, merchant: merchant, shopper: shopper) }

    context 'invalid disbursement when fee=nil' do
      subject { build_stubbed(:disbursement, fee: nil, merchant: merchant, order: order) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid disbursement when actual_price=nil' do
      subject { build_stubbed(:disbursement, actual_price: nil, merchant: merchant, order: order) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid disbursement when disbursed_price=nil' do
      subject { build_stubbed(:disbursement, disbursed_price: nil, merchant: merchant, order: order) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid disbursement when week=nil' do
      subject { build_stubbed(:disbursement, week: nil, merchant: merchant, order: order) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid disbursement when percentage=nil' do
      subject { build_stubbed(:disbursement, percentage: nil, merchant: merchant, order: order) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid disbursement when merchant=nil' do
      subject { build_stubbed(:disbursement, merchant: nil, order: order) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid disbursement when order=nil' do
      subject { build_stubbed(:disbursement, merchant: merchant, order: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end
  end
end
