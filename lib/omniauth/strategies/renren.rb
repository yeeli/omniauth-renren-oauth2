require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Renren < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'http://graph.renren.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :nickname => raw_info['name'],
          :image => raw_info['avatar'][0]['url'],
          :urls => {
            'Renren' => "http://www.renren.com/#{raw_info["id"]}/profile"
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
        @uid ||= access_token.get("https://api.renren.com/v2/user/login/get").parsed['response']['id']
        @raw_info ||= access_token.get("https://api.renren.com/v2/user/get", :params => {'userId' => @uid}).parsed['response']
      rescue
        {'id' => nil, 'avatar' => [{'url' => ''}], 'name' => nil}
      end
    end
  end
end

OmniAuth.config.add_camelization "renren", "Renren"
