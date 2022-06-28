# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    scope :filter_by, lambda { |merchant, week|
                        merchant.present? ? merchant.disbursements.where(week: week) : where(week: week)
                      }
  end
end
