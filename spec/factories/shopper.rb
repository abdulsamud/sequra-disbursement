# frozen_string_literal: true

FactoryBot.define do
  factory :shopper do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    nif { 'B611111111' }
  end
end
