class ThisMonthPaymentReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.find_each do |user|
      PaymentMailer.with(user: user).this_month_payment.deliver_now
    end
  end
end
