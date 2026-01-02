require "test_helper"

class ThisMonthPaymentReminderJobTest < ActiveJob::TestCase
  include ActionMailer::TestHelper

  test "should send an email to all users regarding this month's payment" do
    travel_to Time.zone.local(2026, 1, 1) do
      assert_emails 3 do
        perform_enqueued_jobs do
          ThisMonthPaymentReminderJob.perform_later
        end
      end
    end
  end
end
