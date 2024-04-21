class Dashboard::Admin::UsersController < DashboardController
  def index
    @users = User.all.decorate
  end

  # after_create :add_membership_payment

  # def add_membership_payment
  #   10.times do |i|
  #     MembershipPayment.create()
  #   end
  # end
end
