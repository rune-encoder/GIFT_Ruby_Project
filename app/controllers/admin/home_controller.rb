# app/controllers/admin/dashboard_controller.rb

module Admin
  class HomeController < BaseController
    before_action :require_admin!

    def index
      @active_menu = "home"
    end
  end
end
