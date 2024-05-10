class Dashboard::Admin::UsersController < DashboardController
  def index
    @users = User.all.offset(1).limit(8).order(created_at: :desc).order(updated_at: :desc).decorate
  end

  # after_create :add_membership_payment

  # def add_membership_payment
  #   10.times do |i|
  #     MembershipPayment.create()
  #   end
  # end
end
