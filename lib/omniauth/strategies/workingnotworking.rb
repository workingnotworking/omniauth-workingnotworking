require 'omniauth-oauth'
require 'json'

module OmniAuth
  module Strategies
    class Workingnotworking < OmniAuth::Strategies::OAuth
      option :name, 'wnw'

      option :client_options, { :authorize_url => '/oauth/authorize',
                                :token_url => '/oauth/token',
                                :site => 'https://workingnotworking.com' }

      uid { raw_info['id'] }

      info do
        {
          :first_name       => raw_info['first_name'],
          :last_name        => raw_info['last_name'],
          :email            => raw_info['email'],
          :username         => raw_info['username'],
          :current_login_at => raw_info['current_login_at'],
          :created_at       => raw_info['created_at'],
          :updated_at       => raw_info['updated_at'],
          :avatar           => raw_info['avatar']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/account').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end

    end
  end
end
