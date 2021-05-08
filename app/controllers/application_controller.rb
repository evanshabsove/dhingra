class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_order

  RECAPTCHA_MINIMUM_SCORE = 0.5

  private

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def verify_recaptcha?(token, recaptcha_action)
    secret_key = ENV['re_captcha_private_key']

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json['success'] && json['score'] > RECAPTCHA_MINIMUM_SCORE && json['action'] == recaptcha_action
  end

end
