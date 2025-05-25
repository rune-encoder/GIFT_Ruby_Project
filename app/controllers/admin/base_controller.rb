# app/controllers/admin/base_controller.rb

module Admin
  class BaseController < ApplicationController
    # Use the layout file `app/views/layouts/admin.html.erb`
    layout "admin"
    helper_method :current_admin

    private

    # Used to access the current admin user from the session
    def current_admin
      @current_admin ||= AdminUser.find_by(id: session[:admin_id])
    end

    # The `before_action` filter to ensure the user is logged in
    # If user is not logged in, redirect to the login page
    def require_admin!
      unless current_admin
        redirect_to admin_login_path, alert: "Please log in to access admin panel."
      end
    end
  end
end
