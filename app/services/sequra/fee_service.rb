# frozen_string_literal: true

module Sequra
  # Service that calculate fee according to rules
  class FeeService < BaseService
    attr_reader :order

    def initialize(order)
      super()
      @order = order
    end

    def call
      calculate_fee
    end

    private

    def calculate_fee
      amount = order.amount
      percentage = get_percentage(amount)
      [get_fee(amount, percentage), percentage]
    end

    # returns percentage according to rule
    def get_percentage(amount)
      if amount < 50
        1
      elsif amount >= 50 && amount <= 300
        0.95
      else
        0.85
      end
    end

    # returns formatted fee in two decimals
    def get_fee(amount, percentage)
      format('%0.2f', ((amount * percentage) / 100)).to_f
    end
  end
end
