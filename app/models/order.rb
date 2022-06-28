# frozen_string_literal: true

class Order < ApplicationRecord
  # Validations on columns
  validates :amount, :completed_at, presence: true

  # Associations
  belongs_to :merchant
  belongs_to :shopper
  has_one :disbursement

  # Scope that returns orders with status complete
  scope :completed, -> { where.not(completed_at: nil) }

  # Scope that returns orders with no disburement
  scope :non_disbursed, -> { includes(:disbursement, :merchant).where(disbursement: { id: nil }) }
end
