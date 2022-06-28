require "test_helper"

class Api::DisbursementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_disbursements_index_url
    assert_response :success
  end
end
