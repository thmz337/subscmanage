require "test_helper"

class SubscriptionServiceTest < ActiveSupport::TestCase
  test "should filter by next payment date" do
    subscription_service = SubscriptionService.payment_for_that_day(Date.new(2026, 2, 1))
    assert_equal 2, subscription_service.count
  end
end
