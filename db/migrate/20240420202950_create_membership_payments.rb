class CreateMembershipPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :membership_payments do |t|
      t.references :user, foreign_key: true
      t.integer :amount
      t.string :start_pay
      t.integer :status

      t.timestamps
    end
  end
end
