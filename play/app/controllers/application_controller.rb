class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionView::Helpers::DateHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(admin)
    root_path
  end

  helper_method :start_time
  
  def start_time(match_id)
    match = Bet.find(match_id)
    time_left = (match.match_starts_at - Time.now.in_time_zone).to_i
    return 'started' if time_left <= 0 else return distance_of_time_in_words(time_left)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
