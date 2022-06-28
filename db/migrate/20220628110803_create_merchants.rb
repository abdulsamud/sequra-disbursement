class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :cif, null: false, unique: true

      t.timestamps
    end
  end
end
