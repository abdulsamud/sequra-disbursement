# frozen_string_literal: true

class DisbursementSerializer < ActiveModel::Serializer
  attributes :id, :fee, :actual_price, :disbursed_price, :week, :percentage, :merchant_name, :order_id

  def merchant_name
    object.merchant.name
  end
end
