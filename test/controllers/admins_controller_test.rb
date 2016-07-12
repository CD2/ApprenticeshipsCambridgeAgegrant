require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_show_url
    assert_response :success
  end

  test "should get delete" do
    get admins_delete_url
    assert_response :success
  end

end
