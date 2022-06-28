# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shopper, type: :model do
  describe '#valid' do
    context 'when shopper is valid' do
      subject { build_stubbed(:shopper) }
      it 'is valid' do
        expect(subject).to be_valid
      end
    end
  end

  describe '#invalid' do
    context 'invalid shopper when name=nil' do
      subject { build_stubbed(:shopper, name: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid shopper when email=nil' do
      subject { build_stubbed(:shopper, email: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid shopper when nif=nil' do
      subject { build_stubbed(:shopper, nif: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end
  end
end
