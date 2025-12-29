class Admin::DashboardController < Admin::BaseController
  def index
    @admin_service_presets = Admin::ServicePreset.all
  end
end
