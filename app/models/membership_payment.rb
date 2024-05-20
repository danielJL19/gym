class MembershipPayment < ApplicationRecord
  belongs_to :user
  has_one :sale_membership, class_name: 'SaleMembership'
  enum status: { pending: 0, payed: 1 }
end
