require "test_helper"

class Admin::ServicePresetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:kanrisya)
    @admin_service_preset = admin_service_presets(:preset1)
    @params1 =
    { name: "Test",
      payment_interval: 1,
      payment_unit: "month",
      price: 3000
    }
    @params2 =
    { name: "Test",
      payment_interval: 1,
      payment_unit: "year",
      price: 36000
    }
    sign_in @user
  end

  test "users without administrator privileges cannot access the dashboard" do
    user = users(:thmz)
    sign_in user
    get admin_service_presets_url
    assert_redirected_to root_path # subscription_services#index
    sign_out user
  end

  test "users with administrator privileges cannot access the dashboard" do
    get admin_service_presets_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_service_preset_url
    assert_response :success
  end

  test "should create admin_service_preset" do
    assert_difference("Admin::ServicePreset.count") do
      post admin_service_presets_url, params: { admin_service_preset: @params1 }
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
    patch admin_service_preset_url(@admin_service_preset), params: { admin_service_preset: @params2 }
  end

  test "should destroy admin_service_preset" do
    assert_difference("Admin::ServicePreset.count", -1) do
      delete admin_service_preset_url(@admin_service_preset)
    end

    assert_redirected_to admin_service_presets_url
  end
end
