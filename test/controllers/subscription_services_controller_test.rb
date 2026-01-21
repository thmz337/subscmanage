require "test_helper"

class SubscriptionServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription_service = subscription_services(:service1)
    @user = users(:thmz)
    payment_date = Date.tomorrow
    @params1 =
    { next_payment: payment_date,
      name: "test",
      payment_interval: 1,
      payment_unit: "month",
      price: 3000,
      monetary_unit: "JPY"
    }
    @params2 =
    { next_payment: payment_date,
      name: "test",
      payment_interval: 1,
      payment_unit: "year",
      price: 36000,
      monetary_unit: "JPY"
    }
    sign_in @user
  end

  test "should get index with login" do
    get root_path
    assert_redirected_to subscription_services_path
  end

  test "should get new" do
    get new_subscription_service_url
    assert_response :success
  end

  test "should create subscription_service" do
    assert_difference("SubscriptionService.count") do
      post subscription_services_url, params: { subscription_service: @params1 }
    end

    assert_redirected_to subscription_services_path
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
    patch subscription_service_url(@subscription_service), params: { subscription_service: @params2 }
    assert_redirected_to subscription_services_path
  end

  test "should destroy subscription_service" do
    assert_difference("SubscriptionService.count", -1) do
      delete subscription_service_url(@subscription_service)
    end

    assert_redirected_to subscription_services_url
  end
end
