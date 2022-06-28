# frozen_string_literal: true

module Sequra
  class BaseService
    def self.call(*args)
      new(*args).call
    end
  end
end
