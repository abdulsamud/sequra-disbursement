# frozen_string_literal: true

module Api
  class DisbursementsController < ApplicationController
    before_action :set_merchant, only: %i[index]
    before_action :set_week, only: %i[index]

    def index
      if @week.present?
        disbursements = Disbursement.filter_by(@merchant, @week).includes(:merchant)
        render_success_response(render_disbursement_serializer(disbursements))
      else
        render_error_response('Please select week', :not_found)
      end
    end

    private

    # Find merchant from DB before API calling
    def set_merchant
      @merchant = Merchant.find_by(email: params[:merchant])
    end

    # Fromat and return week days like ['2018-01-01'..'2018-01-07']
    def set_week
      return nil unless params[:week].present?

      date = Date.parse(params[:week])
      @week = date.at_beginning_of_week..date.at_end_of_week
    end
  end
end
