class PaymentMailer < ApplicationMailer
  def this_month_payment
    @user = params[:user]
    @this_month_payment_services = @user.this_month_payment_services
    @this_month_payment = @this_month_payment_services.map { |service| service.price }.sum
    mail(to: @user.email, subject: "今月の支払いについて")
  end
end
