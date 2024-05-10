class Dashboard::Admin::MembershipPaymentsController < DashboardController
  before_action :user_find
  def index
    @membership_payments = @user.payment_months.decorate
  end

  private

  def user_find
    @user = User.find(params[:id])
  end
end
