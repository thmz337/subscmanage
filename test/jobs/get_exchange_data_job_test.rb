require "test_helper"

class GetExchangeDataJobTest < ActiveJob::TestCase
  test "should obtain the data." do
    assert_difference("Exchange.count", Exchange::SUPPORTED_CURRENCIES.count) do
      perform_enqueued_jobs do
        GetExchangeDataJob.perform_later
      end
    end
  end
end
