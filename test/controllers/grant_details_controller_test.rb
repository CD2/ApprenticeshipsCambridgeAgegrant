require 'test_helper'

class GrantDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grant_detail = grant_details(:one)
  end

  test "should get index" do
    get grant_details_url
    assert_response :success
  end

  test "should get new" do
    get new_grant_detail_url
    assert_response :success
  end

  test "should create grant_detail" do
    assert_difference('GrantDetail.count') do
      post grant_details_url, params: { grant_detail: {  } }
    end

    assert_redirected_to grant_detail_url(GrantDetail.last)
  end

  test "should show grant_detail" do
    get grant_detail_url(@grant_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_grant_detail_url(@grant_detail)
    assert_response :success
  end

  test "should update grant_detail" do
    patch grant_detail_url(@grant_detail), params: { grant_detail: {  } }
    assert_redirected_to grant_detail_url(@grant_detail)
  end

  test "should destroy grant_detail" do
    assert_difference('GrantDetail.count', -1) do
      delete grant_detail_url(@grant_detail)
    end

    assert_redirected_to grant_details_url
  end
end
