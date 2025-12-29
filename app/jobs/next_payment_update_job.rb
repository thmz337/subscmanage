class NextPaymentUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    subscription_services = SubscriptionService.payment_for_that_day(Date.today - 1)
    subscription_services.find_each do |service|
      case service.payment_unit
      when "month"
        service.update({ next_payment: service.next_payment >> service.payment_interval })
      when "year"
        service.update({ next_payment: service.next_payment >> (service.payment_interval * 12) })
      end
    end
  end
end
