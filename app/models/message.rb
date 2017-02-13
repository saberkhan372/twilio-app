require 'twilio-ruby'
class Message
  MY_PHONE = '+12244123188'
  attr_accessor :body, :phone_number

  def initialize(body, phone_number)
    @body = body
    @phone_number = phone_number
    # put your own credentials here
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.messages.create(
      from: MY_PHONE,
      to: @phone_number,
      body: @body
    )
    puts "Sending message!"
  end

  def mms_send(media_url)
    @client.messages.create(
      from: MY_PHONE,
      to: @phone_number,
      body: @body,
      media_url: media_url
    )
    puts "Sending message!"
  end

end
