class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.integer :year_established 
      t.integer :loan_amount

      t.timestamps
    end
  end
end
