# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe '#valid' do
    context 'when merchant is valid' do
      subject { build_stubbed(:merchant) }
      it 'is valid' do
        expect(subject).to be_valid
      end
    end
  end

  describe '#invalid' do
    context 'invalid merchant when name=nil' do
      subject { build_stubbed(:merchant, name: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid merchant when email=nil' do
      subject { build_stubbed(:merchant, email: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end

    context 'invalid merchant when cif=nil' do
      subject { build_stubbed(:merchant, cif: nil) }
      it 'is invalid' do
        expect(subject).to_not be_valid
      end
    end
  end
end
