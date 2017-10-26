class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  semantic_breadcrumb :index, :root_path

  # Handle Unauthorized Access

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
end
