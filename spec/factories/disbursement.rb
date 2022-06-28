# frozen_string_literal: true

FactoryBot.define do
  factory :disbursement do
    fee { 1.79 }
    actual_price { 188.93 }
    disbursed_price { 187.14 }
    week { '2018-02-12' }
    percentage { 0.95 }
    merchant { nil }
    order { nil }
  end
end
