class Alert < ActiveRecord::Base
  after_save :send_to_branches

  def send_to_branches
    User.branches.each do |branch|
      task = Task.create(phone_number: branch.phone_number, phrase: self.phrase, recipient: branch)
      # send message using twilio
      account_sid = Rails.configuration.twilio_sid
      auth_token = Rails.configuration.twilio_token
      @client = Twilio::REST::Client.new account_sid, auth_token

      message = @client.account.messages.create(:body => "#{self.phrase}",
          :to => "#{branch.phone_number}",
          :from => Rails.configuration.twilio_phone_number)
    end
  end
end
