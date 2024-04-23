class Dashboard::Admin::RegistrationsController < Devise::RegistrationsController
  def new_user
    @user = User.new
  end

  def create_user
  end
end
