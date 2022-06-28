class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.float :fee, null: false
      t.float :actual_price, null: false
      t.float :disbursed_price, null: false
      t.date :week, null: false, index: true
      t.float :percentage, null: false
      t.references :merchant, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
