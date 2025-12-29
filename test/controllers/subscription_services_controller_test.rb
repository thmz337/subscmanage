require "test_helper"

class SubscriptionServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription_service = subscription_services(:service1)
    @user = users(:thmz)
    @params =
    { next_payment: "2026-01-01",
      name: "test",
      payment_interval: 1,
      payment_unit: "month",
      price: 3000
    }
    sign_in @user
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get new" do
    get new_subscription_service_url
    assert_response :success
  end

  test "should create subscription_service" do
    assert_difference("SubscriptionService.count") do
      post subscription_services_url, params: { subscription_service: @params }
    end

    assert_redirected_to subscription_service_url(SubscriptionService.last)
  end

  test "should show subscription_service" do
    get subscription_service_url(@subscription_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_service_url(@subscription_service)
    assert_response :success
  end

  test "should update subscription_service" do
    sign_in @user
    patch subscription_service_url(@subscription_service), params: { subscription_service: @params }
    assert_redirected_to subscription_service_url(@subscription_service)
  end

  test "should destroy subscription_service" do
    assert_difference("SubscriptionService.count", -1) do
      delete subscription_service_url(@subscription_service)
    end

    assert_redirected_to subscription_services_url
  end
end
