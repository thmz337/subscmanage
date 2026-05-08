class PaymentMailer < ApplicationMailer
  helper SubscriptionServicesHelper

  def this_month_payment
    @user = params[:user]
    @this_month_payment_services = @user.this_month_payment_services
    @this_month_payment = @this_month_payment_services.map do |service|
      service.price_to_jpy
    end.sum
    mail(to: @user.email, subject: "今月の支払いについて")
  end
end
