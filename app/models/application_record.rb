class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # before_create :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  # end
end
