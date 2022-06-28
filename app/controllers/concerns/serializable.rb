# frozen_string_literal: true

module Serializable
  extend ActiveSupport::Concern

  # Render disbursements JSON using serializer with data
  def render_disbursement_serializer(data)
    ActiveModelSerializers::SerializableResource.new(data, each_serializer: DisbursementSerializer)
  end
end
