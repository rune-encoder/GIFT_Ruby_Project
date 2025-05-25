# app/controllers/admin/admins_controller.rb

module Admin
  class AdminsController < BaseController
    before_action :require_admin!
    before_action :require_owner_permission, only: [ :create, :destroy ]
    before_action :set_admin, only: [ :destroy ]

    def index
      @admins = Admin.order(:permission_level, :username)
    end

    def new
      @admin = AdminUser.new
    end

    def create
      if creating_owner?
        redirect_to admin_admins_path, alert: "Cannot create another owner-level admin." and return
      end

      if exceeds_role_limit?
        redirect_to admin_admins_path, alert: "Maximum number of admins reached for this role." and return
      end

      @admin = AdminUser.new(admin_params)

      if @admin.save
        redirect_to admin_admins_path, notice: "Admin created successfully."
      else
        render :new
      end
    end

    def destroy
      if @admin.owner?
        redirect_to admin_admins_path, alert: "Cannot delete the owner-level admin." and return
      end

      @admin.destroy
      redirect_to admin_admins_path, notice: "Admin deleted successfully."
    end

    private

    def set_admin
      @admin = AdminUser.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :username, :email, :password, :password_confirmation, :permission_level)
    end

    def admin_params
      params.require(:admin_user).permit(:name, :username, :email, :password, :password_confirmation, :permission_level)
    end

    def exceeds_role_limit?
      limits = {
        manager: 3,
        editor: 3,
        viewer: 3
      }

      role = AdminUser.permission_levels.key(admin_params[:permission_level].to_i)
      count = AdminUser.where(permission_level: admin_params[:permission_level]).count

      limits[role] && count >= limits[role]
    end
  end
end
