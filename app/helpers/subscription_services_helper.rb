module SubscriptionServicesHelper
  def payment_unit_to_ja(unit)
    case unit
    when "month"
      "月"
    when "year"
      "年"
    else
      "不明"
    end
  end
end
