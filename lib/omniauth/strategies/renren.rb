require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Renren < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'http://graph.renren.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      uid { raw_info['uid'] }

      info do
        {
          :name => raw_info['name'],
          :nickname => raw_info['name'],
          :image => raw_info["tinyurl"],
          :urls => {
            'Renren' => "http://www.renren.com/#{raw_info["uid"]}/profile"
          }
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = 'access_token'
        params ||= { :v => "1.0", :format => "json", :call_id => Time.now.to_i, :method => "users.getInfo" }
        @raw_info ||= MultiJson.decode(access_token.post( "https://api.renren.com/restserver.do", body: params).body)[0]
      end
    end
  end
end
