# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    amount { 252.56 }
    completed_at { '03/01/2018 01:59:56' }
    merchant { nil }
    shopper { nil }
  end
end
