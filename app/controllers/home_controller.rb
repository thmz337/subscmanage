class HomeController < ApplicationController
  def index
    redirect_to subscription_services_path if user_signed_in?
  end
end
