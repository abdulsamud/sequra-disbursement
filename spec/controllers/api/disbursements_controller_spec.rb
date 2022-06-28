# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::DisbursementsController, 'GET #index' do
  before do
    merchant = create(:merchant)
    @merchant1 = create(:merchant)
    shopper = create(:shopper)
    order = create(:order, merchant: merchant, shopper: shopper)
    create_list(:disbursement, 3, merchant: merchant, order: order)
    create_list(:disbursement, 3, merchant: @merchant1, order: order)
  end

  context 'call api without week and merchant' do
    it 'renders error message' do
      get :index
      expect(response).to have_http_status(:not_found)
      message = JSON.parse(response.body)['message']
      expect(message).to eq 'Please select week'
    end
  end

  context 'call api with week param' do
    it 'render disbursement list according to week' do
      get :index, params: { week: '2018-02-12' }
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)['data']
      expect(data.count).to eq 6
    end
  end

  context 'call api with merchant and week param' do
    it 'render disbursement list according to week' do
      get :index, params: { merchant: @merchant1.email, week: '2018-02-12' }
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)['data']
      expect(data.count).to eq 3
    end
  end
end
