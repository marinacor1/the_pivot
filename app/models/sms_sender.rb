require "twilio-ruby"

class SmsSender
  def initialize(total_cost)
    @total_cost = total_cost
    @client = Twilio::REST::Client.new ENV["SID"], ENV["AuthToken"]
  end

  def send_sms
    @client.account.messages.create(
      from: ENV["PHONE"],
      to: ENV["MYPHONE"],
      body: "A new team has been created. New revenue: #{@total_cost}"
    )
  end
end
