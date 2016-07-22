require 'test_helper'

class TrainingProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_provider = training_providers(:one)
  end

  test "should get index" do
    get training_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_training_provider_url
    assert_response :success
  end

  test "should create training_provider" do
    assert_difference('TrainingProvider.count') do
      post training_providers_url, params: { training_provider: {  } }
    end

    assert_redirected_to training_provider_url(TrainingProvider.last)
  end

  test "should show training_provider" do
    get training_provider_url(@training_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_provider_url(@training_provider)
    assert_response :success
  end

  test "should update training_provider" do
    patch training_provider_url(@training_provider), params: { training_provider: {  } }
    assert_redirected_to training_provider_url(@training_provider)
  end

  test "should destroy training_provider" do
    assert_difference('TrainingProvider.count', -1) do
      delete training_provider_url(@training_provider)
    end

    assert_redirected_to training_providers_url
  end
end
