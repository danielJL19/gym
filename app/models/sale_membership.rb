class SaleMembership < ApplicationRecord
  belongs_to :user
  belongs_to :payment_month, class_name: 'membership_payment'
end
