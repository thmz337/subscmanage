require "uri"
require "json"

class GetExchangeDataJob < ApplicationJob
  queue_as :default

  retry_on Net::OpenTimeout, wait: 5.seconds, attempts: 10

  def perform(*args)
    Exchange::SUPPORTED_CURRENCIES.each do | currency |
      raw_data = JSON.parse(Net::HTTP.get(URI.parse("https://api.frankfurter.dev/v1/latest?base=#{currency}")))
      Exchange.new(
        base_currency: raw_data["base"].to_s,
        base_date: raw_data["date"].to_date,
        data: raw_data.except("base", "date", "amount").to_json
      ).save
    end
  end
end
