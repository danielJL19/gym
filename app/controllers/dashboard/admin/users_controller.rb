class Dashboard::Admin::UsersController < DashboardController
  def index
    @users = User.all.decorate
  end
end
