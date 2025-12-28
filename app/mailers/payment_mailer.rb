class PaymentMailer < ApplicationMailer
  def this_month_payment
    @user = params[:user]
    mail(to: @user.email, subject: "今月の支払いについて")
  end
end
