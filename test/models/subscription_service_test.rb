require "test_helper"

class SubscriptionServiceTest < ActiveSupport::TestCase
  test "should filter by next payment date" do
    subscription_service = SubscriptionService.payment_for_that_day(Date.new(2026, 1, 1))
    assert_equal 1, subscription_service.count
  end
end
