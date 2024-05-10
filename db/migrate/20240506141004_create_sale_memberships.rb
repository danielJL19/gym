class CreateSaleMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :sale_memberships do |t|
      t.integer :amount
      t.string :status
      t.string :buy_order
      t.string :session_id
      t.date :transaction_date
      t.references :user, null: false, foreign_key: true
      t.references :membership_payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
