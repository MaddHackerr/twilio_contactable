module TwilioContactable
  module Gateway
    class Response
      def initialize(*args)
        @options = args.last
      end

      def success?
        :success == @options[:status]
      end
    end
    Success = Response.new(:status => :success)
    Error   = Response.new(:status => :error)

    API_VERSION   = '2010-04-01'

    class << self

      def initiate_voice_call(record, to, from = nil)

        unless TwilioContactable.configuration.website_address
          raise "Please define your `website_address` config parameter in the TwilioContactable initializer. It should be in the format of: \"http://example.com/\""
        end

        url = TwilioContactable.configuration.website_address.chomp('/')
        url = "#{url}/#{record.class.twilio_contactable.controller}"
        url = "#{url}/start_voice_confirmation?contactable_type=#{record.class}&contactable_id=#{record.id}"

        deliver :voice,
                'To' => to,
                'From' => from,
                'Url' => url
      end

      def deliver_sms(message, to, from = nil)
        deliver :sms,
                'Message' => message,
                'To' => to,
                'From' => from
      end

      def account
        @account ||= begin
          if TwilioContactable.configuration.client_id.blank? ||
             TwilioContactable.configuration.client_key.blank?
             raise "Add your Twilio account id (as client_id) and token (as client_key) to the TwilioContactable.configure block"
          end
          gem 'twiliolib'
          require 'twiliolib'
          Twilio::RestAccount.new(
                      TwilioContactable.configuration.client_id,
                      TwilioContactable.configuration.client_key
                    )
        end
      end

      protected

        def deliver(type, data = {})

          data['From'] = TwilioContactable.configuration.default_from_phone_number if data['From'].blank?
          raise "'From' number required for Twilio" unless data['From']

          service = case type
          when :sms
            'SMS/Messages'
          when :voice
            'Calls'
          end

          response = post service, data
 
          Net::HTTPCreated == response.code_type ?
                                TwilioContactable::Gateway::Success :
                                TwilioContactable::Gateway::Error
        end

        def post(service, data = {})
          url = "/#{API_VERSION}/Accounts/#{TwilioContactable.configuration.client_id}/#{service}"
          puts "putting data: #{data.inspect}"
          puts "to url: #{url}"
          account.request url,
                          "POST",
                          data
        end
    end
  end
end
