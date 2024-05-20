class CreateWorkshops < ActiveRecord::Migration[7.1]
  def change
    create_table :workshops do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :schedule, null: false
      t.integer :size, null: false
      t.string :location
      t.date :start_time, null: false
      t.string :end_time, null: false
      t.integer :price
      t.integer :category

      t.timestamps
    end
  end
end
