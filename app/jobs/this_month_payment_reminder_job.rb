class ThisMonthPaymentReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "This month payment!"
  end
end
