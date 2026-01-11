require "test_helper"

class ExchangeTest < ActiveSupport::TestCase
  test "latest_exchange must retrieve the data with the most recent date" do
    assert_equal Exchange.latest_exchange("JPY"), exchanges(:exchange1)
  end
end
