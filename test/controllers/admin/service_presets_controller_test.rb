require "test_helper"

class Admin::ServicePresetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_service_preset = admin_service_presets(:one)
  end

  test "should get index" do
    get admin_service_presets_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_service_preset_url
    assert_response :success
  end

  test "should create admin_service_preset" do
    assert_difference("Admin::ServicePreset.count") do
      post admin_service_presets_url, params: { admin_service_preset: { name: @admin_service_preset.name, payment_interval: @admin_service_preset.payment_interval, payment_unit: @admin_service_preset.payment_unit, price: @admin_service_preset.price } }
    end

    assert_redirected_to admin_service_preset_url(Admin::ServicePreset.last)
  end

  test "should show admin_service_preset" do
    get admin_service_preset_url(@admin_service_preset)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_service_preset_url(@admin_service_preset)
    assert_response :success
  end

  test "should update admin_service_preset" do
    patch admin_service_preset_url(@admin_service_preset), params: { admin_service_preset: { name: @admin_service_preset.name, payment_interval: @admin_service_preset.payment_interval, payment_unit: @admin_service_preset.payment_unit, price: @admin_service_preset.price } }
    assert_redirected_to admin_service_preset_url(@admin_service_preset)
  end

  test "should destroy admin_service_preset" do
    assert_difference("Admin::ServicePreset.count", -1) do
      delete admin_service_preset_url(@admin_service_preset)
    end

    assert_redirected_to admin_service_presets_url
  end
end
