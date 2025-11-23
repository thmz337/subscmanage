require "test_helper"

class SubscServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subsc_service = subsc_services(:one)
  end

  test "should get index" do
    get subsc_services_url
    assert_response :success
  end

  test "should get new" do
    get new_subsc_service_url
    assert_response :success
  end

  test "should create subsc_service" do
    assert_difference("SubscService.count") do
      post subsc_services_url, params: { subsc_service: { next_payment: @subsc_service.next_payment, name: @subsc_service.name, payment_interval: @subsc_service.payment_interval, payment_unit: @subsc_service.payment_unit, price: @subsc_service.price } }
    end

    assert_redirected_to subsc_service_url(SubscService.last)
  end

  test "should show subsc_service" do
    get subsc_service_url(@subsc_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_subsc_service_url(@subsc_service)
    assert_response :success
  end

  test "should update subsc_service" do
    patch subsc_service_url(@subsc_service), params: { subsc_service: { next_payment: @subsc_service.next_payment, name: @subsc_service.name, payment_interval: @subsc_service.payment_interval, payment_unit: @subsc_service.payment_unit, price: @subsc_service.price } }
    assert_redirected_to subsc_service_url(@subsc_service)
  end

  test "should destroy subsc_service" do
    assert_difference("SubscService.count", -1) do
      delete subsc_service_url(@subsc_service)
    end

    assert_redirected_to subsc_services_url
  end
end
