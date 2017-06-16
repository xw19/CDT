class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
   dealer_dealerships_path
  end

  def current_ability
    @current_ability ||= ::Ability.new(current_dealer)
  end
end
