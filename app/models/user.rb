class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payment_months, class_name: 'MembershipPayment'
  has_many :sale_memberships
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_save :create_membership_payment

  private

  def create_membership_payment
    1.upto(12) do |i|
      MembershipPayment.create(
        user_id: id,
        amount: 15_990,
        status: 0,
        start_pay: created_at + i.month
      )
    end
  end
end
