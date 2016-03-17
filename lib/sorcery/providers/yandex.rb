require 'sorcery/providers/base'

module Sorcery
  module Providers
    # This class adds support for OAuth with vk.com.
    #
    #   config.yandex.key = <key>
    #   config.yandex.secret = <secret>
    #   ...
    #
    class Yandex < Base
      include Protocols::Oauth2

      attr_accessor :auth_path, :token_path, :user_info_url, :scope,
                    :response_type, :with_open_id

      def initialize
        super

        @scope          = nil
        @site           = 'https://oauth.yandex.ru'
        @user_info_url  = 'https://login.yandex.ru/info'
        @auth_path      = '/authorize'
        @token_path     = '/token'
        @grant_type     = 'authorization_code'
        @with_open_id   = false
      end

      def get_user_hash(access_token)
        user_hash = auth_hash(access_token)
        
        params = {
          format: :json,
          oauth_token: access_token.token,
          with_openid_identity: with_open_id
        }

        response = access_token.get(user_info_url, params: params)

        if user_hash[:user_info] = JSON.parse(response.body)
          user_hash[:user_info]['full_name'] = [user_hash[:user_info]['first_name'], user_hash[:user_info]['last_name']].join(' ')
          user_hash[:uid] = user_hash[:user_info]['id']
          user_hash[:user_info]['email'] = user_hash[:user_info]['default_email']
        end

        user_hash
      end

      # calculates and returns the url to which the user should be redirected,
      # to get authenticated at the external provider's site.
      def login_url(params, session)
        self.authorize_url({ authorize_url: auth_path,  })
      end

      def process_callback(params, session)
        args = {}.tap do |a|
          a[:code] = params[:code] if params[:code]
        end

        get_access_token(args, token_url: token_path, token_method: :post)
      end
    end
  end
end
