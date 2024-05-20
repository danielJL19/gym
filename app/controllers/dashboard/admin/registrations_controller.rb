class Dashboard::Admin::RegistrationsController < DashboardController
  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(params_user)
    if @user.save
      @users = User.all.offset(1).limit(8).order(created_at: :desc).order(updated_at: :desc).decorate
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend('users', partial: 'dashboard/admin/users/table/body',
                                          locals: { user: @user.decorate })
          ]
        end
        format.html { redirect_to dashboard_admin_users_path, notice: 'Se ha creado con éxito' }
      end
    else
      render :new_user, status: :unprocessable_entity
      nil
    end
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end
end
