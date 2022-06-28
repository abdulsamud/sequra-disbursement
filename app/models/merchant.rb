# frozen_string_literal: true

class Merchant < ApplicationRecord
  # Validations on columns
  validates :name, :email, :cif, presence: true

  # Associations
  has_many :orders, dependent: :destroy
  has_many :disbursements, dependent: :destroy
end
