require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Workingnotworking < OmniAuth::Strategies::OAuth2
      option :name, 'workingnotworking'

      option :client_options, { :authorize_path => '/oauth/authorize',
                                :access_token_path => '/oauth/token',
                                :site => 'https://workingnotworking.com' }

      uid { raw_info['id'].to_s }

      info do
        {
          :first_name       => raw_info['first_name'],
          :last_name        => raw_info['last_name'],
          :email            => raw_info['email'],
          :username         => raw_info['username'],
          :phone            => raw_info['phone'],
          :address1         => raw_info['address1'],
          :address2         => raw_info['address2'],
          :city             => raw_info['city'],
          :state            => raw_info['state'],
          :country          => raw_info['country'],
          :postal_code      => raw_info['postal_code'],
          :latitude         => raw_info['latitude'],
          :longitude        => raw_info['longitude'],
          :company_id       => raw_info['company_id'],
          :time_zone        => raw_info['time_zone'],
          :current_login_at => raw_info['current_login_at'],
          :created_at       => raw_info['created_at'],
          :updated_at       => raw_info['updated_at'],
          :avatar           => raw_info['avatar'],
          :roles            => raw_info['roles'],
          :profile => {
            :username        => raw_info['profile']['username'],
            :company_website => raw_info['profile']['company_website'],
            :custom_title    => raw_info['profile']['custom_title']
          },
          :avatar_image => {
            :image => {
              :version  => raw_info['avatar_image']['image']['version'],
              :filename => raw_info['avatar_image']['image']['filename'],
              :width    => raw_info['avatar_image']['image']['width'],
              :height   => raw_info['avatar_image']['image']['height'],
              :bytes    => raw_info['avatar_image']['image']['bytes']
            }
          }
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/account').parsed
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      def callback_url
        full_host + script_name + callback_path
      end

    end
  end
end
