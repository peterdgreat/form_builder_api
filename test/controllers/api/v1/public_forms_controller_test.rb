require "test_helper"

class Api::V1::PublicFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_public_forms_show_url
    assert_response :success
  end

  test "should get submit" do
    get api_v1_public_forms_submit_url
    assert_response :success
  end
end
