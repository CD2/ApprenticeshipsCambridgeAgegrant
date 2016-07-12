require 'test_helper'

class GrantReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grant_review = grant_reviews(:one)
  end

  test "should get index" do
    get grant_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_grant_review_url
    assert_response :success
  end

  test "should create grant_review" do
    assert_difference('GrantReview.count') do
      post grant_reviews_url, params: { grant_review: { file: @grant_review.file } }
    end

    assert_redirected_to grant_review_url(GrantReview.last)
  end

  test "should show grant_review" do
    get grant_review_url(@grant_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_grant_review_url(@grant_review)
    assert_response :success
  end

  test "should update grant_review" do
    patch grant_review_url(@grant_review), params: { grant_review: { file: @grant_review.file } }
    assert_redirected_to grant_review_url(@grant_review)
  end

  test "should destroy grant_review" do
    assert_difference('GrantReview.count', -1) do
      delete grant_review_url(@grant_review)
    end

    assert_redirected_to grant_reviews_url
  end
end
