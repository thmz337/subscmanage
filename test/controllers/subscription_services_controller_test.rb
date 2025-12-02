require "test_helper"

class SubscriptionServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription_service = subscription_services(:one)
  end

  test "should get index" do
    get subscription_services_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_service_url
    assert_response :success
  end

  test "should create subscription_service" do
    assert_difference("SubscService.count") do
      post subscription_services_url, params: { subscription_service: { next_payment: @subscription_service.next_payment, name: @subscription_service.name, payment_interval: @subscription_service.payment_interval, payment_unit: @subscription_service.payment_unit, price: @subscription_service.price } }
    end

    assert_redirected_to subscription_service_url(SubscService.last)
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
    patch subscription_service_url(@subscription_service), params: { subscription_service: { next_payment: @subscription_service.next_payment, name: @subscription_service.name, payment_interval: @subscription_service.payment_interval, payment_unit: @subscription_service.payment_unit, price: @subscription_service.price } }
    assert_redirected_to subscription_service_url(@subscription_service)
  end

  test "should destroy subscription_service" do
    assert_difference("SubscService.count", -1) do
      delete subscription_service_url(@subscription_service)
    end

    assert_redirected_to subscription_services_url
  end
end
