require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get g" do
    get rails_g_url
    assert_response :success
  end

  test "should get admin::label" do
    get rails_admin::label_url
    assert_response :success
  end

end
