class Dashboard::Admin::RegistrationsController < DashboardController
  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(params_user)
    if @user.save
      redirect_to dashboard_admin_users_path, notice: 'Se ha creado con éxito'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_user
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end
end
