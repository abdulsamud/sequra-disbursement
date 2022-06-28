# frozen_string_literal: true

module Sequra
  # Service that disburses order prices according to week and and merchant
  class DisburseService < BaseService
    def call
      disburse_order_price
    end

    private

    def disburse_order_price
      orders = Order.completed.non_disbursed
      orders.each do |order|
        fee, percentage = Sequra::FeeService.call(order)
        disbursed_price = format('%0.2f', (order.amount - fee)).to_f
        Disbursement.create(fee: fee, actual_price: order.amount,
                            disbursed_price: disbursed_price, week: week,
                            percentage: percentage, merchant: order.merchant, order: order)
      end
    end

    # returns date like '2018-01-03'
    def week
      Date.today.strftime('%Y-%m-%d')
    end
  end
end
