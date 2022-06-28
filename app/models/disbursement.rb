# frozen_string_literal: true

class Disbursement < ApplicationRecord
  include ActiveModel::Serialization

  # Included concern for filtering data
  include Filterable

  # Validations on columns
  validates :fee, :actual_price, :disbursed_price, :week, :percentage, presence: true

  # Associations
  belongs_to :merchant
  belongs_to :order
end
