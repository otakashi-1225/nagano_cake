class ApplicationController < ActionController::Base
	before_action :customers_configure_permitted_parameters, if: :devise_controller?

	protected

	def customers_configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
	end
end
