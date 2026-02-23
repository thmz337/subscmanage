require "test_helper"

class PaymentMailerTest < ActionMailer::TestCase
  test "this month payment" do
    travel_to Time.zone.local(2026, 1, 1) do
      puts Date.current
      user = users(:payment)
      email = PaymentMailer.with(user: user).this_month_payment

      assert_emails 1 do
        email.deliver_now
      end

      body = email.body.to_s
      this_month_payment = user.this_month_payment_services.map { |service| service.price }.sum

      assert_equal [ "from@example.com" ], email.from
      assert_equal [ user.email ], email.to
      assert_equal "今月の支払いについて", email.subject
      assert_match "#{this_month_payment}", body
      assert_match subscription_services(:service5).name, body
      assert_no_match subscription_services(:service6).name, body
    end
  end
end
