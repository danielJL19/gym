class MembershipPayment < ApplicationRecord
  belongs_to :user
  has_one :sale_membership
  enum status: { pending: 0, payed: 1 }
end
