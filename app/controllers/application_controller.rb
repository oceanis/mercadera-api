class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def authorize_api_key
    # if Rails.env == 'production'
    #   user = User.find_by(api_token: params[:token])
    #   head :unauthorized unless user
    # end
  end
end
