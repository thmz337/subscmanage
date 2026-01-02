require "test_helper"

class NextPaymentUpdateJobTest < ActiveJob::TestCase
  test "services with payment dates one day before or earlier than the job execution date must be update" do
    travel_to Time.zone.local(2026, 1, 1) do
      perform_enqueued_jobs do
        NextPaymentUpdateJob.perform_later
      end

      assert_equal subscription_services(:service3).next_payment.to_s, "2026-01-31"
    end

    travel_to Time.zone.local(2026, 1, 2) do
      perform_enqueued_jobs do
        NextPaymentUpdateJob.perform_later
      end

      assert_equal subscription_services(:service4).next_payment.to_s, "2027-01-01"
    end
  end

  test "services with payment dates after the job execution date should not be update" do
    travel_to Time.zone.local(2026, 1, 1) do
      perform_enqueued_jobs do
        NextPaymentUpdateJob.perform_later
      end

      assert_equal subscription_services(:service1).next_payment.to_s, "2026-01-01"
      assert_equal subscription_services(:service2).next_payment.to_s, "2026-02-01"
    end
  end
end
