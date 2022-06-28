# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    cif { 'B611111111' }
  end
end
