require "test_helper"

class Dashboard::Admin::WorkshopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_admin_workshops_index_url
    assert_response :success
  end
end
