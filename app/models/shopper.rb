# frozen_string_literal: true

class Shopper < ApplicationRecord
  # Validations on columns
  validates :name, :email, :nif, presence: true

  # Associations
  has_many :orders, dependent: :destroy
end
