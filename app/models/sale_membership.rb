class SaleMembership < ApplicationRecord
  belongs_to :user
  belongs_to :membership_payment

  after_create :update_status_membership

  private

  def update_status_membership
    membership_payment.update(status: 1)
  end
end
