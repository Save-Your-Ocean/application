module SYO
  class API < Grape::API
    version 'v1', using: :accept_version_header
    format :json
    prefix :api

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    mount SYO::Locations

    get :status do
      {
        online: true,
        msg: 'API is up and running!'
      }
    end
  end
end
